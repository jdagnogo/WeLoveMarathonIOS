//
//  TipsModel.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation

struct Tips : Codable, Identifiable {
    let id: String
    let title: String
    var description: String
    let ordinal: Int
    let icon: String
    let color: String

    init(
        id: String = "",
        title: String = "",
        description: String = "",
        ordinal: Int = 0,
        icon: String = "",
        color: String = ""
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.ordinal = ordinal
        self.icon = icon
        self.color = color
    }
}
