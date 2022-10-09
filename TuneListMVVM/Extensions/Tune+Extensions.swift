//
//  Tune+Extensions.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import CoreData
import Foundation

extension Tune: BaseModel {
    
    static var all: NSFetchRequest<Tune> {
        let request = Tune.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
