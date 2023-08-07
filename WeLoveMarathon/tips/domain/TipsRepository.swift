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

