//
//  GameDataBase.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 27.02.2022.
//

import Foundation

struct Game {
    
    var gameDictionary: [String: Any] = [
        "question": "2 X 2 = ?",
        "answer" : ["1", "0", "4", "5"],
        "correctIndex": 2,
        "win": 1000
    ]
    
    let gameArray100 = [
        ["win": 100, "id": 001, "question": "2 X 2 = ?", "answer": ["5", "2", "0", "4"], "correctIndex": 3],
        ["win": 100, "id": 002, "question": "2 + 2 = ?", "answer": ["4", "0", "2", "5"], "correctIndex": 0],
        ["win": 100, "id": 003, "question": "2 - 2 = ?", "answer": ["4", "0", "2", "5"], "correctIndex": 1],
        ["win": 100, "id": 004, "question": "2 / 2 = ?", "answer": ["4", "0", "2", "1"], "correctIndex": 3]
    ]
    
    let gameArray1000 = [
        ["win": 1000, "id": 001, "question": "2 X 2 - 2 = ?", "answer": ["5", "2", "0", "4"], "correctIndex": 1],
        ["win": 1000, "id": 002, "question": "2 + 2 X 2 = ?", "answer": ["4", "8", "2", "5"], "correctIndex": 1],
        ["win": 1000, "id": 003, "question": "2 - 2 * 2 = ?", "answer": ["0", "4", "2", "5"], "correctIndex": 0],
        ["win": 1000, "id": 003, "question": "2 / 2 * 2 = ?", "answer": ["3", "4", "2", "5"], "correctIndex": 0],
    ]
}

