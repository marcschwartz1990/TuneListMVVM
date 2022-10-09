//
//  CoreDataManager.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import Foundation
import CoreData

//Initialize the CoreData stack

class CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "TuneListModel")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}

