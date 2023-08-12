//
//  AboutService.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol AboutService {
    func getAbout() -> AnyPublisher<[AboutModel], Error>
}

public final class AboutServiceImpl : AboutService{
    private var firestore = Firestore.firestore()
    
    func getAbout() -> AnyPublisher<[AboutModel], Error> {
        return Future<[AboutModel], Error> { [self] promise in
            firestore.self.collection("About").getDocuments { snapshot, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                let documents = snapshot?.documents ?? []
                let result = documents.compactMap { document -> AboutModel? in
                    do {
                        return try document.data(as: AboutModel.self)
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
