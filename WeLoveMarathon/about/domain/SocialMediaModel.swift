//
//  SocialMediaModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct SocialMediaModel : Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let icon: String
    let link: String
    let ordinal: Int
    
    init(
        link: String = "",
        ordinal: Int = 0,
        icon: String = ""
    ) {
        self.id = UUID().uuidString
        self.link = link
        self.ordinal = ordinal
        self.icon = icon
    }
}
