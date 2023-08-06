//
//  DataFreshnessType.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//
import Foundation

let EXPIRATION_IN_MINUTES = 1

enum DataFreshnessType {
    case about
    case beach
    case blog
    case food
    case home
    case activities
    case activitiesTag
    case banner
    case run
    case shopping
    case shoppingCategories
    case activitiesCategories
    case foodCategories
    case foodTag
    case shoppingTag
    case tips
    case culture
    case sport
    case wineTour
    case wineSocial
    case wineInfo
    case sportCategories
    
    // Computed property to get the time interval for each DataType
    var timeInterval: TimeInterval {
        let expirationInMinutes = Double(EXPIRATION_IN_MINUTES)
        switch self {
        case .about, .beach, .blog, .food, .home, .activities, .activitiesTag,
                .banner, .run, .shopping, .shoppingCategories, .activitiesCategories,
                .foodCategories, .foodTag, .shoppingTag, .tips, .culture, .sport,
                .wineTour, .wineSocial, .wineInfo, .sportCategories:
            return expirationInMinutes * 60.0
        }
    }
    
    static func from(name: String) -> DataFreshnessType? {
           switch name {
           case "about":
               return .about
           case "beach":
               return .beach
           case "blog":
               return .blog
           case "food":
               return .food
           case "home":
               return .home
           case "activities":
               return .activities
           case "activitiesTag":
               return .activitiesTag
           case "banner":
               return .banner
           case "run":
               return .run
           case "shopping":
               return .shopping
           case "shoppingCategories":
               return .shoppingCategories
           case "activitiesCategories":
               return .activitiesCategories
           case "foodCategories":
               return .foodCategories
           case "foodTag":
               return .foodTag
           case "shoppingTag":
               return .shoppingTag
           case "tips":
               return .tips
           case "culture":
               return .culture
           case "sport":
               return .sport
           case "wineTour":
               return .wineTour
           case "wineSocial":
               return .wineSocial
           case "wineInfo":
               return .wineInfo
           case "sportCategories":
               return .sportCategories
           default:
               return nil
           }
       }
    
    func getName() -> String {
        switch self {
        case .about:
            return "about"
        case .beach:
            return "beach"
        case .blog:
            return "blog"
        case .food:
            return "food"
        case .home:
            return "home"
        case .activities:
            return "activities"
        case .activitiesTag:
            return "activitiesTag"
        case .banner:
            return "banner"
        case .run:
            return "run"
        case .shopping:
            return "shopping"
        case .shoppingCategories:
            return "shoppingCategories"
        case .activitiesCategories:
            return "activitiesCategories"
        case .foodCategories:
            return "foodCategories"
        case .foodTag:
            return "foodTag"
        case .shoppingTag:
            return "shoppingTag"
        case .tips:
            return "tips"
        case .culture:
            return "culture"
        case .sport:
            return "sport"
        case .wineTour:
            return "wineTour"
        case .wineSocial:
            return "wineSocial"
        case .wineInfo:
            return "wineInfo"
        case .sportCategories:
            return "sportCategories"
        }
    }
    
    
    func generateNextUpdate() -> TimeInterval {
        return Date().adding(minutes : EXPIRATION_IN_MINUTES).timeIntervalSince1970
    }
}

extension Date {
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}
