//
//  WeLoveMarathonApp.swift
//  WeLoveMarathon
//
//  Created by Jean francois dagnogo on 10/07/2023.
//

import SwiftUI

@main
struct WeLoveMarathonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
