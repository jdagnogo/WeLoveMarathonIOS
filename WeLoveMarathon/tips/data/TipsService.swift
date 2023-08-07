//
//  TipsService.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TipsService {
    func getTips() -> AnyPublisher<[Tips], Error>
}

public final class TipsServiceImpl : TipsService{
    private var firestore = Firestore.firestore()
    
    func getTips() -> AnyPublisher<[Tips], Error> {
        return Future<[Tips], Error> { [self] promise in
            firestore.self.collection("Tips").getDocuments { snapshot, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                let documents = snapshot?.documents ?? []
                let result = documents.compactMap { document -> Tips? in
                    do {
                        return try document.data(as: Tips.self)
                    } catch {
                        print("Error parsing document: \(error)")
                        return nil
                    }
                }
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()
    }
}

