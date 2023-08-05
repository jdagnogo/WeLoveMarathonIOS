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
    
    init(service: TipsService) {
        self.service = service
    }
    
    func getTips() -> AnyPublisher<[Tips], Error> {
        return service.getTips()
    }
}

