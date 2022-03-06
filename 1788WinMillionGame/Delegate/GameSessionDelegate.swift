//
//  GameSessionDelegate.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

protocol GameSessionDelegate {
    
    func addDidAnswerToQuestion(questionPrice: Int?)
    func getScore() -> Int
    func getGameDate() -> Date
}
