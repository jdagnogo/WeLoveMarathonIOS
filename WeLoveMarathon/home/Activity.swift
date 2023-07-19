//
//  Activity.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 19/07/2023.
//

import Foundation
import SwiftUI

enum Activity: String, CaseIterable {
    case activity
    case beaches
    case culture
    case shopping
    case foodDrink
    case wine
    
    func getActivityDataModel() -> ActivityDataModel {
        switch self {
        case .activity:
            return ActivityDataModel(color: Color.green, name: "Activities", iconPath: "logo")
        case .beaches:
            return ActivityDataModel(color: Color.orange, name: "Activities", iconPath: "logo")
        case .culture:
            return ActivityDataModel(color: Color.blue, name: "Activities", iconPath: "logo")
        case .shopping:
            return ActivityDataModel(color: Color.purple, name: "Activities", iconPath: "logo")
        case .foodDrink:
            return ActivityDataModel(color: Color.yellow, name: "Activities", iconPath: "logo")
        case .wine:
            return ActivityDataModel(color: Color.pink, name: "Activities", iconPath: "logo")
        }
    }
}
