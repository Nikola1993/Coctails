//
//  Coctails_AppApp.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import SwiftUI

@main
struct Coctails_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
