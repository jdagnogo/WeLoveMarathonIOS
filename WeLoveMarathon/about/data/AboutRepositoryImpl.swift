//
//  AboutRepositoryImpl.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine


public final class AboutRepositoryProtocolImpl: AboutRepositoryProtocol {
    private var service: AboutService
    private var local: AboutLocalData
    private var dataFreshnessRepository: DataFreshnessRepository
    
    init(service: AboutService, local: AboutLocalData, dataFreshnessRepository: DataFreshnessRepository) {
        self.service = service
        self.local = local
        self.dataFreshnessRepository = dataFreshnessRepository
    }
    
    func getAbout() -> AnyPublisher<[AboutModel], Error> {
        return Future<[AboutModel], Error> { promise in
            var cancellables: Set<AnyCancellable> = []
            let isDataFresh = self.dataFreshnessRepository.isDataFresh(.about)
            if !isDataFresh {
                print("fetching from firebase ...")
                // if the data are not fresh or the user asked for a fetch => we request data from firebase
                self.service.getAbout().sink(receiveCompletion: { completion in
                    if case .failure(_) = completion {
                        // If it's an error, we emit the latest value from the db
                        self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                            promise(.success(resource))
                        }).store(in: &cancellables)
                    }
                }, receiveValue: { resource in
                    // if it's a success, we save the data
                    self.local.saveToCoreData(resource)
                    self.dataFreshnessRepository.save(.about)
                    self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                        promise(.success(resource))
                    }).store(in: &cancellables)
                }).store(in: &cancellables)
            } else {
                print("fetching from Local ...")
                self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                    promise(.success(resource))
                }).store(in: &cancellables)
            }
        }.eraseToAnyPublisher()
    }
}
