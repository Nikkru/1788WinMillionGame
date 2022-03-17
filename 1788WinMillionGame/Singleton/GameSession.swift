//
//  GameSession.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

final class GameSession: GameSessionDelegate {

    private var currentScore: Int?
    private var didAnswersCount: Int?
    private var allQuestionsCount: Int?
//    private var gameDate: Date?

    func addTotalQuestions(count: Int) { allQuestionsCount = count }
    
    func getScore() -> Int { currentScore ?? 0 }
    func getDidAnswerCount() -> Int { didAnswersCount ?? 0 }
    func getAllAnswersCount() -> Int { allQuestionsCount ?? 0 }
    
    
    func addDidAnswerToQuestion(questionPrice: Int?) {
        if let price = questionPrice {
            didAnswersCount = 1 + (didAnswersCount ?? 0)
            currentScore = price + (currentScore ?? 0)
        }
    }
    
//    func getGameDate() -> Date { gameDate ?? Date()}
    

}
