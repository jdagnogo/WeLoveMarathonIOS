//
//  GetAboutUseCase.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine

protocol GetAboutInteractor{
    func invoke() -> AnyPublisher<[AboutModel], Error>
}

struct GetAboutInteractorImpl : GetAboutInteractor{
    let repository : AboutRepositoryProtocol
    
    init(repository : AboutRepositoryProtocol){
        self.repository = repository
    }
    
    func invoke() -> AnyPublisher<[AboutModel], Error> {
        return repository
            .getAbout()
            .tryMap { element -> [AboutModel] in
                element
            }
            .eraseToAnyPublisher()
    }
}
