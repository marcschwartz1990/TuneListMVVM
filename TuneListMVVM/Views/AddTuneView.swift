//
//  AddTuneView.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import SwiftUI

struct AddTuneView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: AddTuneViewModel
    
    init(vm: AddTuneViewModel) {
        self.vm = vm
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $vm.title)
                    
                    Picker("Key", selection: $vm.key) {
                        Section {
                            ForEach(vm.keys.majorKeys, id: \.self) {
                                Text($0)
                            }
                        } header: {
                            Text("Major keys")
                        }
                        
                        Section {
                            ForEach(vm.keys.minorKeys, id: \.self) {
                                Text($0)
                            }
                        } header: {
                            Text("minor keys")
                        }
                    }
                    
                    TextField("Style", text: $vm.style)
                } header: {
                    Text("Quick Reference Info")
                }
            
                Section {
                    TextField("Composer", text: $vm.composer)
                    TextField("Date Composed", text: $vm.yearComposed)
                } header: {
                    Text("More Info")
                }
            }
            .navigationTitle("Add New Tune")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddTuneView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            AddTuneView(vm: AddTuneViewModel(context: viewContext))
        }
    }
}
