////
////  DicesView.swift
////  Dice
////
////  Created by Makwan BK on 4/26/20.
////  Copyright © 2020 Makwan BK. All rights reserved.
////
//
//import SwiftUI
//
//struct DicesView: View {
//    
//    @State private var diceNumber = 3
//    @State private var sideNumber = 10
//    @State private var diceArray = [Int] = [Int]()
//    
//    @State private var showSettings = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    ForEach(0..<self.dice, id:\.self) { dice in
//                        DiceView(diceNumber: Array(1...self.sideNumber).shuffled()[dice])
//                    }
//                }
//                
//                Button("Roll") {
//                    //
//                }
//                    .frame(width: 90, height: 40)
//                    .background(Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(20)
//                    .padding(.top)
//            }
//            .navigationBarTitle("Dicee", displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: {
//                self.showSettings = true
//            }) {
//                Image(systemName: "gear")
//            })
//            
//                .sheet(isPresented: $showSettings) {
//                    SettingsView(numberOfDices: self.$diceNumber)
//            }
//        }
//    }
//
//    
//}
//
//struct DicesView_Previews: PreviewProvider {
//    static var previews: some View {
//        DicesView()
//    }
//}
