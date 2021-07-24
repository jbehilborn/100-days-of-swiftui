//
//  UsersListApp.swift
//  UsersList
//
//  Created by John Hilborn on 2021-07-23.
//

import SwiftUI

@main
struct UsersListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
