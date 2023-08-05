//
//  GetTipsInteractor.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine

protocol GetTipsInteractor{
    func invoke() -> AnyPublisher<[Tips], Error>
}

struct GetTipsInteractorImpl : GetTipsInteractor{
    let repository : TipsRepositoryProtocol
    
    init(repository : TipsRepositoryProtocol){
        self.repository = repository
    }
    
    func invoke() -> AnyPublisher<[Tips], Error> {
        return repository
            .getTips()
            .tryMap { element -> [Tips] in
                element
            }
            .eraseToAnyPublisher()
    }
}
