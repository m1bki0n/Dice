//
//  ContentView.swift
//  Dice
//
//  Created by Makwan BK on 4/25/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var result = Roll()
    
    var body: some View {
            
        TabView {
            DiceView(res: self.result)
                .tabItem {
                    Image(systemName: "hexagon")
                    Text("Play")
                   
            }
            
            HistoryView(history: self.result)
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
