//
//  QuickReferenceViewModel.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import CoreData
import Foundation


@MainActor
// Responsible for fetching all the different kinds of tunes
class QuickReferenceViewModel: NSObject, ObservableObject {
    
    @Published var tunes = [TuneViewModel]()
    @Published var selectedTune: TuneViewModel?
    
    private let fetchedResultsController: NSFetchedResultsController<Tune>
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Tune.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let tunes = fetchedResultsController.fetchedObjects else {
                return
            }
            
            self.tunes = tunes.map(TuneViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func update(tune: TuneViewModel) {
        guard let selectedTune = selectedTune else { return }
        
        if let index = tunes.firstIndex(of: selectedTune) {
            tunes[index] = tune
        }
    }
    
    func deleteTune(tuneId: NSManagedObjectID) {
        do {
            guard let tune = try context.existingObject(with: tuneId) as? Tune else {
                return
            }
            try tune.delete()
        } catch {
            print(error)
        }
    }
    
//    func resetSelectedTune() {
//        selectedTune = nil
//    }
}

extension QuickReferenceViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let tunes = controller.fetchedObjects as? [Tune] else {
            return
        }
        
        self.tunes = tunes.map(TuneViewModel.init)
    }
}

struct TuneViewModel: Identifiable, Equatable {
    
    private var tune: Tune
    
    init(tune: Tune) {
        self.tune = tune
    }
    
    // Give data from Tune so view can display it
    
    var id: NSManagedObjectID {
        tune.objectID
    }
    
    var title: String {
        tune.title ?? "Unknown Title"
    }
    
    var key: String {
        tune.key ?? "Unknown Key"
    }
    
    var style: String {
        tune.style ?? "Unknown Style"
    }
    
    var composer: String {
        tune.composer ?? "Unknown Composer"
    }
    
    var yearComposed: String {
        tune.yearComposed ?? "Unknown Year of Composition"
    }
}
