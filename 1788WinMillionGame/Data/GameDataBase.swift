//
//  GameDataBase.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 27.02.2022.
//

import Foundation

enum Price: Int {
    case superLight = 100
    case light = 1000
    case medium = 10000
    case hard = 100000
}

struct GameDataProvider {
    
    private let questions100 = [
        
        GameModel(question: "2 X 2 = ?",
                  answers: [
                    1: "5",
                    2: "2",
                    3: "4"],
                  validAnswerId: 3,
                  questionPrice: 100),
        
        GameModel(question: "2 + 2 = ?",
                  answers: [
                    1: "4",
                    2: "2",
                    3: "5"],
                  validAnswerId: 0,
                  questionPrice: 100),
        
        GameModel(question: "2 - 2 = ?",
                  answers: [
                    1: "0",
                    2: "2",
                    3: "1"],
                  validAnswerId: 1,
                  questionPrice: 100)]
    
    private let questions1000 = [
        
        GameModel(question: "2 X 2 - 2 = ?",
                  answers: [
                    1: "2",
                    2: "0",
                    3: "4"],
                  validAnswerId: 1,
                  questionPrice: 1000),
        
        GameModel(question: "2 + 2 X 2 = ?",
                  answers: [
                    1: "4",
                    2: "8",
                    3: "6"],
                  validAnswerId: 2,
                  questionPrice: 1000),
        
        GameModel(question: "2 / 2 + 2 = ?",
                  answers: [
                    1: "4",
                    2: "3",
                    3: "2"],
                  validAnswerId: 2,
                  questionPrice: 1000)
    ]
    
    private let questions10000 = [
        
        GameModel(question: "(2 X 2 - 2) X 2 = ?",
                  answers: [
                    1: "3",
                    2: "0",
                    3: "4"],
                  validAnswerId: 3,
                  questionPrice: 10000),
        
        GameModel(question: "(2 + 2 X 2) / 2 = ?",
                  answers: [
                    1: "3",
                    2: "8",
                    3: "6"],
                  validAnswerId: 1,
                  questionPrice: 10000),
        
        GameModel(question: "(2 / 2 + 2) + 2 = ?",
                  answers: [
                    1: "4",
                    2: "5",
                    3: "2"],
                  validAnswerId: 2,
                  questionPrice: 10000)
    ]
    
    private let questions100000 = [
        
        GameModel(question: "4 - (2 X 2 - 2) X 2 = ?",
                  answers: [
                    1: "2",
                    2: "0",
                    3: "4"],
                  validAnswerId: 2,
                  questionPrice: 100000),
        
        GameModel(question: "4 - (2 + 2 X 2) / 2 = ? ",
                  answers: [
                    1: "4",
                    2: "1",
                    3: "6"],
                  validAnswerId: 2,
                  questionPrice: 100000),
        
        GameModel(question: "4 - (2 / 2 + 2) + 2 = ? ",
                  answers: [
                    1: "3",
                    2: "6",
                    3: "2"],
                  validAnswerId: 1,
                  questionPrice: 100000)]
    
    func getQuestionsCount() -> Int { questions100.count}
    
    func getQuestion(priceQuestion: Int) -> GameModel? {
        
        let price = priceQuestion ?? 0
 
        switch price {
        case 100:
            let questions = questions100
            return questions.randomElement()
        case 1000:
            let questions = questions1000
            return questions.randomElement()
        case 10000:
            let questions = questions10000
            return questions.randomElement()
        case 100000:
            let questions = questions100000
            return questions.randomElement()
        default:
            let questions = questions1000
            return questions.last
        }
    }
}

