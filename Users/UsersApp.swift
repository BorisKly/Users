//
//  UsersApp.swift
//  Users
//
//  Created by Borys Klykavka on 18.03.2025.
//

import SwiftUI

@main
struct UsersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
