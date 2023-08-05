//
//  SingleSouceOfTruthStrategy.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Combine

func resourceAsPublisher<T, A>(
    forceFetch: Bool = false,
    fetchFromLocal: @escaping () -> AnyPublisher<[T], Error>,
    networkCall: @escaping () -> AnyPublisher<A, Error>,
    saveCallResource: @escaping ([A]) -> Void,
    checkDataFreshness: @escaping () -> Bool = { true }
) -> AnyPublisher<[T], Error> {
    return Future<[T], Error> { promise in
        var cancellables: Set<AnyCancellable> = []
        let isDataFresh = checkDataFreshness()
        if forceFetch || !isDataFresh {
            // if the data are not fresh or the user asked for a fetch => we request data from firebase
            networkCall().sink(receiveCompletion: { completion in
                if case .failure(_) = completion {
                    // If it's an error, we emit the latest value from the db
                    fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                        promise(.success(resource))
                    }).store(in: &cancellables)
                }
            }, receiveValue: { resource in
                // if it's a success, we save the data
                saveCallResource([resource])
                fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                    promise(.success(resource))
                }).store(in: &cancellables)
            }).store(in: &cancellables)
        } else {
            fetchFromLocal().sink(receiveCompletion: { _ in }, receiveValue: { resource in
                promise(.success(resource))
            }).store(in: &cancellables)
        }
    }.eraseToAnyPublisher()
}
