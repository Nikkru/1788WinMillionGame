//
//  GameModel.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 27.02.2022.
//

import Foundation


struct GameModel {
    let win: Int
    let questions: [Questions]
}

struct Questions {
    let question: String
    let answers: Answer
}

struct Answer {
    let firstAnswer, secondAnswer, thirdAnswer, forthAnswer: String
}
