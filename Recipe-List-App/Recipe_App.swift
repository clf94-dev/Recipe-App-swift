//
//  Recipe_List_App.swift
//  Recipe App
//
//  Created by Carmen Lucas on 17/6/23.
//

import SwiftUI

@main
struct Recipe_List_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
