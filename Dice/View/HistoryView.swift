//
//  HistoryView.swift
//  Dice
//
//  Created by Makwan BK on 4/25/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var history : Roll
    
    var body: some View {
        NavigationView {
            List(history.dice, id: \.id) { dice in
                
                HStack {
                    
                    Text("\(dice.total)")
                        .font(.title)
                    Spacer()
                    Text("\(dice.newFormatDate)")
                }
            }
            .navigationBarTitle("History")
        }
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
