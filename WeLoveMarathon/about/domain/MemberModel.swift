//
//  MemberModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 12/08/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct MemberModel : Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let name: String
    let icon: String
    let link: String?
    let ordinal: Int
    
    init(
        id: String = "",
        name: String = "",
        link: String? = nil,
        ordinal: Int = 0,
        icon: String = ""
    ) {
        self.id = id
        self.name = name
        self.link = link
        self.ordinal = ordinal
        self.icon = icon
    }
}
