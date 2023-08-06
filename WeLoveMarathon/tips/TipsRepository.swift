//
//  TipsRepository.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine

protocol TipsRepositoryProtocol {
    func getTips() -> AnyPublisher<[Tips], Error>
}


public final class TipsRepositoryProtocolImpl: TipsRepositoryProtocol {
    private var service: TipsService
    private var local: TipsLocalData
    private var dataFreshnessRepository: DataFreshnessRepository
    
    init(service: TipsService, local: TipsLocalData, dataFreshnessRepository: DataFreshnessRepository) {
        self.service = service
        self.local = local
        self.dataFreshnessRepository = dataFreshnessRepository
    }
    
    func getTips() -> AnyPublisher<[Tips], Error> {
        return Future<[Tips], Error> { promise in
            var cancellables: Set<AnyCancellable> = []
            let isDataFresh = self.dataFreshnessRepository.isDataFresh(.tips)
            if !isDataFresh {
                print("fetching from firebase ...")
                // if the data are not fresh or the user asked for a fetch => we request data from firebase
                self.service.getTips().sink(receiveCompletion: { completion in
                    if case .failure(_) = completion {
                        // If it's an error, we emit the latest value from the db
                        self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                            promise(.success(resource))
                        }).store(in: &cancellables)
                    }
                }, receiveValue: { resource in
                    // if it's a success, we save the data
                    self.local.saveTipsToCoreData(resource)
                    self.dataFreshnessRepository.save(.tips)
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

