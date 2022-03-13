//
//  GameSessionResult.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

// Memento - Originator
struct GameSessionResult: Codable {
    
    var winMoney = 0
//    var gameDate: Date? = nil
    var didAnswer = 0
    var persent = 0
    
    init(winMoney: Int,
//         gameDate: Date,
         didAnswer: Int,
         persent: Int) {
        
        self.winMoney = winMoney
//        self.gameDate = gameDate
        self.didAnswer = didAnswer
        self.persent = persent
    }
    
    func description() -> String {

//        let stringDate: String?
//        if let date = gameDate  {
//            stringDate = date.toString()
//        } else { stringDate = "The date of this game is unknown" }

        return "Did Won " + String(winMoney) +
            " / did answer " + String(didAnswer) +
            " / persent of right " + String(persent)
//            " / \(stringDate)"
    }
    
    enum CodingKeys: String, CodingKey {
        
        case winMoney
//        case gameDate
        case didAnswer
        case persent
    }
}
