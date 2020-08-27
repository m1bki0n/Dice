//
//  SettingsView.swift
//  Dice
//
//  Created by Makwan BK on 4/26/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    //    @Binding var numberOfDices: Int
    @Binding var numberOfSides : Int
    @State private var sidesArray = ["6", "12", "24", "48", "96"]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    Text("Choose a side number")
                    
                    Picker(selection: $numberOfSides, label: Text("choose")) {
                        ForEach(0..<self.sidesArray.count) {
                            Text("\(self.sidesArray[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
            }
                
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(diceRound: 1)
//    }
//}
