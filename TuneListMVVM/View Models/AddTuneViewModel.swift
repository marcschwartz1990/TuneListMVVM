//
//  AddTuneViewModel.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import CoreData
import Foundation


class AddTuneViewModel: ObservableObject {
    
    @Published var keys = Keys()
    
    // Data to save to CoreData
    @Published var title: String = ""
    @Published var key: String = "C Major"
    @Published var style: String = ""
    @Published var composer: String = ""
    @Published var yearComposed: String = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let tune = Tune(context: context)
            tune.title = title
            tune.key = key
            tune.style = style
            tune.composer = composer
            tune.yearComposed = yearComposed
            try tune.save()
        } catch {
            print(error)
        }
    }
}
