//
//  AboutModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation

struct AboutModel: Codable, Identifiable, Hashable {
    let id: String
    let mail: String
    let phone: String
    let policy: String
    let members: [MemberModel]
    let socialMedias: [SocialMediaModel]
    
    init(
        id: String = "",
        mail: String = "",
        phone: String = "",
        policy: String = "",
        members: [MemberModel] = [],
        socialMedias: [SocialMediaModel] = []
    ) {
        self.id = id
        self.mail = mail
        self.phone = phone
        self.policy = policy
        self.members = members
        self.socialMedias = socialMedias
    }
}



