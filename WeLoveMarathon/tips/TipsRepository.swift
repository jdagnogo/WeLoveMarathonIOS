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
    
    init(service: TipsService, local: TipsLocalData) {
        self.service = service
        self.local = local
    }
    
    func getTips() -> AnyPublisher<[Tips], Error> {
        return Future<[Tips], Error> { promise in
            var cancellables: Set<AnyCancellable> = []
            let isDataFresh = true
            if !isDataFresh {
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
                    self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                        promise(.success(resource))
                    }).store(in: &cancellables)
                }).store(in: &cancellables)
            } else {
                self.local.fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                    promise(.success(resource))
                }).store(in: &cancellables)
            }
        }.eraseToAnyPublisher()
    }
}

