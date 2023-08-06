//
//  DataFreshnessRepository.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation
import Combine
import CoreData

protocol DataFreshnessRepository{
    func isDataFresh(_ type : DataFreshnessType) -> Bool
    func save(_ type : DataFreshnessType) -> Void
}

public class DataFreshnessRepositoryImpl : DataFreshnessRepository{
    let context = CoreDataManager.shared.viewContext
    
    func save(_ type: DataFreshnessType) {
        let entity = DataFreshnessEntity(context : context)
        entity.dataName = type.getName()
        entity.updateTime = type.generateNextUpdate()
        do {
            try context.save()
        } catch {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    func isDataFresh(_ type: DataFreshnessType) -> Bool {
        let fetchRequest: NSFetchRequest<DataFreshnessEntity> = DataFreshnessEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dataName == %@", type.getName())

        do {
            let fetchedEntities = try context.fetch(fetchRequest)
            if let loadedType = fetchedEntities.first {
                return loadedType.updateTime > Date().timeIntervalSince1970
            }
        } catch {
            print("Error fetching from Core Data: \(error)")
        }
        return false
    }
}
