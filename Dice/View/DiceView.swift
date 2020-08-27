//
//  DiceView.swift
//  Dice
//
//  Created by Makwan BK on 4/25/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import SwiftUI

struct DiceView: View {
    
    @State private var rectNumber = 2
    @State private var diceNumber1 = 0
    @State private var diceNumber2 = 0
    @State private var diceRound = 0
    
    var diceNumber = 0
    
    @State private var total = 0
    
    @State private var showSettings = false
    
    @ObservedObject var res : Roll
    
    @State private var maxValue = [6, 12, 24, 48, 96]
    
    @State private var animationValue = false
    
    var body: some View {
        
//        HStack {
//            ZStack {
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.white)
//                    .frame(width: 90, height: 90)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .strokeBorder(Color.black, lineWidth: 4)
//                )
//                    .padding()
//
//                Text("\(diceNumber)")
//                    .font(.largeTitle)
//            }
//        }
        
        NavigationView {
            GeometryReader { geo in
                VStack {
        
                    HStack {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 90, height: 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(Color.black, lineWidth: 4)
                            )
                                .padding()
//                                .rotationEffect(.degrees(self.animationValue ? -12 : 0))
                                
                            
                            Text("\(self.diceNumber1)")
                                .font(.largeTitle)
                        }

                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 90, height: 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(Color.black, lineWidth: 4)
                            )
                                .padding()
                            
                            Text("\(self.diceNumber2)")
                                .font(.largeTitle)
                        }
                        
//                        ForEach(0..<self.rectNumber, id: \.self) { rect in
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(Color.white)
//                                    .frame(width: 90, height: 90)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .strokeBorder(Color.black, lineWidth: 4)
//                                )
//                                    .padding()
//
//                                Text("aa")
//                            }
//
//                        }
                    }
                    .padding(65)
                    
                    Spacer()
                    if self.total != 0 {
                        
                        Text("Total: \(self.total)")
                            .font(.system(size: 22)).bold()
                        
                    }
                    Button("Roll") {
                        self.total = 0
                        self.animationValue = false
                        
                        for i in 1...5 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 0.20)) {
                                self.diceNumber1 = Int.random(in: 1...self.maxValue[self.diceRound])
                                self.diceNumber2 = Int.random(in: 1...self.maxValue[self.diceRound])
                            }
                            
                            if i == 5 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 0.20)) {
                                    print("saving")
                                    
                                    self.total = self.diceNumber1 + self.diceNumber2
                                    
                                    let result = Dice(dice1: self.diceNumber1, dice2: self.diceNumber2, round: self.diceRound, total: self.total)
                                    
                                    self.animationValue = true
                                    
                                    self.res.dice.append(result)
                                    self.res.dice.sort {$0.date > $1.date}
                                    self.res.saveData()
                                    
                                }
                            }
                            
                        }
                        
                    }
                    .frame(width: 110, height: 50)
                    .font(.system(size: 30))
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    .padding(30)
                    
                    
                }
            }
            .navigationBarTitle("Dice")
            .navigationBarItems(trailing: Button(action: {
                self.showSettings.toggle()
            }) {
                Image(systemName: "gear").resizable().scaledToFit().frame(width: 27, height: 25)
                
            })
                
                .sheet(isPresented: $showSettings) {
                    SettingsView(numberOfSides: self.$diceRound)
            }
        }
    }
        
}
//
//struct DiceView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        DiceView(res: Ro)
//    }
//}
