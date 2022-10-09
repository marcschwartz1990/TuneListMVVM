//
//  QuickReferenceView.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import SwiftUI

struct QuickReferenceView: View {
    
    // MARK: - Need to incorporate Edit Tune functionality
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var quickReferenceVM: QuickReferenceViewModel
    
    init(vm: QuickReferenceViewModel) {
        self.quickReferenceVM = vm
    }
    
    @State private var showingAddTuneView = false
    @State private var showingTuneDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(quickReferenceVM.tunes) { tune in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("**\(tune.title)**")
                                    .padding([.bottom, .trailing], 1)
                                HStack {
                                    Text("**Key**: \(tune.key)")
                                    Text("|")
                                    Text("**Style**: \(tune.style)")
                                }
                                .font(.caption)
                            }
                            
                            Spacer()
                            
                            Menu {
                                Button("Tune Details") {
                                    showingTuneDetailView = true
                                }
                                
                                Button("Edit Song Info") {
                                    // Edit Song View
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.headline)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            quickReferenceVM.selectedTune = tune
                        }
                        
                    }
                    .onDelete(perform: deleteTune)
                }
            }
            .sheet(isPresented: $showingAddTuneView) {
                AddTuneView(vm: AddTuneViewModel(context: viewContext))
            }
            .sheet(isPresented: $showingTuneDetailView) {
                TuneDetailView(tune: quickReferenceVM.selectedTune)
            }
            .navigationTitle("Quick Reference")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddTuneView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    
    private func deleteTune(at offsets: IndexSet) {
        offsets.forEach { index in
            let tune = quickReferenceVM.tunes[index]
            quickReferenceVM.deleteTune(tuneId: tune.id)
        }
    }
    
}

struct QuickReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        QuickReferenceView(vm: QuickReferenceViewModel(context: viewContext))
    }
}
