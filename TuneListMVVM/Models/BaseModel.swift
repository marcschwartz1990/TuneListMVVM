//
//  BaseModel.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import CoreData
import Foundation

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
        func save() throws
        func delete() throws
}

extension BaseModel where Self: NSManagedObject {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentStoreContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
