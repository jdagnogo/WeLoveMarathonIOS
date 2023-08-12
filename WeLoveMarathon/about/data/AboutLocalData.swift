//
//  AboutLocalData.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import Combine
import CoreData

class AboutLocalData{
    func saveToCoreData(_ about: [AboutModel]) {
        let context = CoreDataManager.shared.viewContext
        
        about.forEach{data -> Void in
            let entity = AboutEntity(context: context)
            
            entity.id = data.id
            entity.mail = data.mail
            entity.phone = data.phone
            entity.policy = data.policy
            
            data.members.forEach { memberData in
                let memberEntity = MemberEntity(context: context)
                memberEntity.id = memberData.id
                memberEntity.name = memberData.name
                memberEntity.icon = memberData.icon
                memberEntity.link = memberData.link
                memberEntity.ordinal = Int16(memberEntity.ordinal)
                entity.addToMembers(memberEntity)
            }
            
            data.socialMedias.forEach { socialMediaData in
                let socialMediaEntity = SocialMediaEntity(context: context)
                socialMediaEntity.id = socialMediaData.id
                socialMediaEntity.link = socialMediaData.link
                socialMediaEntity.icon = socialMediaData.icon
                socialMediaEntity.ordinal = Int16(socialMediaData.ordinal)
                entity.addToSocials(socialMediaEntity)
            }
            
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error)")
            }
        }
    }
    
    func fetchFromLocal() -> AnyPublisher<[AboutModel], Error> {
        let context = CoreDataManager.shared.viewContext
        let fetchRequest: NSFetchRequest<AboutEntity> = AboutEntity.fetchRequest()
        
        return Future<[AboutModel], Error> { promise in
            do {
                let fetchedEntities = try context.fetch(fetchRequest)
                var aboutModels: [AboutModel] = []
                
                for entity in fetchedEntities {
                    let aboutModel = AboutModel(
                        id: entity.id ?? "",
                        mail: entity.mail ?? "",
                        phone: entity.phone ?? "",
                        policy: entity.policy ?? "",
                        members: fetchMembers(entity: entity),
                        socialMedias: fetchSocials(entity: entity)
                    )
                    aboutModels.append(aboutModel)
                }

                promise(.success(aboutModels))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}


private func fetchMembers(entity : AboutEntity)->[MemberModel]{
    return (entity.members as? Set<MemberEntity>)?.compactMap { memberEntity in
        MemberModel(
            name: memberEntity.name ?? "",
            link: memberEntity.link ?? "",
            ordinal: Int(memberEntity.ordinal),
            icon: memberEntity.icon ?? ""
        )
    } ?? []
}

private func fetchSocials(entity : AboutEntity)->[SocialMediaModel] {
    return (entity.socials as? Set<MemberEntity>)?.compactMap { socialMediaEntity in
        SocialMediaModel(
            link: socialMediaEntity.link ?? "",
            ordinal: Int(socialMediaEntity.ordinal),
            icon: socialMediaEntity.icon ?? ""
        )
    } ?? []
}
