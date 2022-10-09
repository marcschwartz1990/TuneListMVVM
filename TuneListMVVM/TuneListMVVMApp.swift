//
//  TuneListMVVMApp.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import SwiftUI

@main
struct TuneListMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            MainMenuView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
