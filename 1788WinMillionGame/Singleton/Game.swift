//
//  Game.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

final class Game {
    
    static let instance = Game()
    
    var session: GameSession?
    var result = [GameSessionResult]()
    
    func getResults() {
        
        guard let gameSession = self.session else { return }
        
        let count = gameSession.getDidAnswerCount()
        let totalCount = gameSession.getAllAnswersCount()
        
        self.result.append(GameSessionResult(
                            winMoney: gameSession.getScore(),
                            gameDate: gameSession.getGameDate(),
                            didAnswer: count,
                            persent: totalCount == 0 ? 0 : (count * 100) / totalCount)
        )
        try? GameCaretaker<[GameSessionResult]>().saveRecord(records: self.result)
        session = nil
    }
}
