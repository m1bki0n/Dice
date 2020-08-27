//
//  Result.swift
//  Dice
//
//  Created by Makwan BK on 4/25/20.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import Foundation


class Roll: ObservableObject {
    @Published var dice : [Dice] = []
    init() {
        
        let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("SaveHistory1")
        
        if let data = try? Data(contentsOf: filename) {
            if let decoded = try? JSONDecoder().decode([Dice].self, from: data) {
                self.dice = decoded
                
                self.dice.sort {$0.date > $1.date}
                
                return
            }
            
            
        }
        
        self.dice = []
    }
    
    func saveData() {
        let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("SaveHistory1")
        
        if let data = try? JSONEncoder().encode(dice) {
           try? data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        }
        
        
    }

}

struct Dice: Codable, Identifiable {
    var id = UUID()
    var dice1 : Int
    var dice2 : Int
    var round : Int
    var date = Date()
    var total: Int
    
    var newFormatDate: String {
        let format = DateFormatter()
        format.dateFormat = "d MMM, yyyy h:mm a"
        
        return format.string(from: date)
    }
}
