//
//  ContentView.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/8/22.
//

import SwiftUI

struct MainMenuView: View {
    
    let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        QuickReferenceView(vm: QuickReferenceViewModel(context: viewContext))
                    } label: {
                        Text("Quick Reference")
                    }
                    
//                    NavigationLink {
//                        SongIndexView()
//                    } label: {
//                        Text("Song Index")
//                    }
                }
                .padding()
                .font(.headline)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
