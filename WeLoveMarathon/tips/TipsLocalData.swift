//
//  TipsLocalData.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine
import CoreData

class TipsLocalData{
    func saveTipsToCoreData(_ tips: [Tips]) {
        let context = CoreDataManager.shared.viewContext
        
        // Assuming your Core Data entity is named "TipsEntity"
        tips.forEach{data -> Void in
            let tipsEntity = TipsEntity(context: context)
            tipsEntity.id = data.id
            tipsEntity.title = data.title
            tipsEntity.desc = data.description
            tipsEntity.ordinal = Int16(data.ordinal)
            tipsEntity.icon = data.icon
            tipsEntity.color = data.color
            
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error)")
            }
        }
    }
    
    func fetchFromLocal() -> AnyPublisher<[Tips], Error> {
        let context = CoreDataManager.shared.viewContext
        let fetchRequest: NSFetchRequest<TipsEntity> = TipsEntity.fetchRequest()
        
        return Future<[Tips], Error> { promise in
            do {
                let tipsEntities = try context.fetch(fetchRequest)
                let tipsModels = tipsEntities.map { tipsEntity -> Tips in
                    // Map the properties of TipsEntity to TipsModel
                    Tips(
                        id: tipsEntity.id ?? "",
                        title: tipsEntity.title ?? "",
                        description: tipsEntity.desc ?? "",
                        ordinal: Int(tipsEntity.ordinal),
                        icon: tipsEntity.icon ?? "",
                        color: tipsEntity.color ?? ""
                    )
                }
                promise(.success(tipsModels))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
