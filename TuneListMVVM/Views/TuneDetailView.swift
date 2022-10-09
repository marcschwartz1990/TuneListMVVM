//
//  TuneDetailView.swift
//  TuneListMVVM
//
//  Created by Marc-Developer on 10/9/22.
//

import SwiftUI

struct TuneDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var tune: TuneViewModel?
    
    // This view needs a selectedTune
    
    var body: some View {
        VStack {
            Text(tune?.title ?? "Unknown Title")
                .lineLimit(1)
                .allowsTightening(true)
                .minimumScaleFactor(0.5)
                .font(.custom("Georgia", size: 36))
                .font(.largeTitle)
                .padding([.top, .bottom])
            
            
            Group {
                HStack {
                    HStack {
                        Text("Key:")
                            .foregroundColor(.secondary)
                        Text(tune?.key ?? "Unknown Key")
                    }
                    
                    Text("|")
                    
                    HStack {
                        Text("Style:")
                            .foregroundColor(.secondary)
                        Text(tune?.style ?? "Unknown Style")
                    }
                }
                
                Divider()
                
                VStack {
                    VStack {
                        Text("Composed By")
                            .foregroundColor(.secondary)
                        Text(tune?.composer ?? "Unknown Composer")
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Year Composed")
                            .foregroundColor(.secondary)
                        Text(tune?.yearComposed ?? "Unknown Year of Composition")
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .font(.custom("Georgia", size: 16))
            
            Spacer()
            
            Divider()
            
        }
        .padding()
    }
}

//struct TuneDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TuneDetailView()
//    }
//}
