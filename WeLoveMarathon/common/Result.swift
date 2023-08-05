//
//  Result.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 05/08/2023.
//

import Foundation

enum Result<T> {
    case idle
    case loading
    case failed
    case success(items : Array<T>)
}
