//
//  Game.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

final class Game {
    
    static let instance = Game()
    
    private init() {}
    
    var session: GameSession?
    var results = [GameSessionResult]()
    
    func setupResults() {
        
        guard let gameSession = session else {
            print("session is nil")
            return }
        
        let count = gameSession.getDidAnswerCount()
        let totalCount = gameSession.getAllAnswersCount()
        
        results.append(GameSessionResult(
                            winMoney: gameSession.getScore(),
//                            gameDate: gameSession.getGameDate(),
                            didAnswer: count,
                            persent: totalCount == 0 ? 0 : (count * 100) / totalCount)
        )
        try? GameCaretaker<[GameSessionResult]>().saveRecord(records: results)
        print(results.description)
        session = nil
    }
}
