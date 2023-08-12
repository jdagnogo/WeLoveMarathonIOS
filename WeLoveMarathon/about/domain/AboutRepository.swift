//
//  AboutRepository.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine

protocol AboutRepositoryProtocol {
    func getAbout() -> AnyPublisher<[AboutModel], Error>
}
