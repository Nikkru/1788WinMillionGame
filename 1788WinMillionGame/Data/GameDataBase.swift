//
//  GameDataBase.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 27.02.2022.
//

import Foundation

struct GameArray {
    let index: String
    let value: Any
}

//class Game {
//    
//    var gameDictionary: [String: Any] = [
//        "win": 100,
//        "question": "2 X 2 = ?",
//        "answer" : ["1", "0", "4", "5"],
//        "correctIndex": 0
//    ]
    
 
    
    let gameArray100 = [
        ["win": 100, "id": 1, "question": "2 X 2 = ?", "answer": ["5", "2", "4"], "correctIndex": 2],
        ["win": 100, "id": 2, "question": "2 + 2 = ?", "answer": ["4", "2", "5"], "correctIndex": 0],
        ["win": 100, "id": 3, "question": "2 - 2 = ?", "answer": ["0", "2", "1"], "correctIndex": 0],
    ]
    
    let gameArray1000 = [
        ["win": 1000, "id": 1, "question": "2 X 2 - 2 = ?", "answer": ["2", "0", "4"], "correctIndex": 0],
        ["win": 1000, "id": 2, "question": "2 + 2 X 2 = ?", "answer": ["4", "8", "6"], "correctIndex": 1],
        ["win": 1000, "id": 3, "question": "2 / 2 + 2 = ?", "answer": ["4", "3", "2"], "correctIndex": 1],
    ]
    
    let gameArray10000 = [
        ["win": 10000, "id": 1, "question": "(2 X 2 - 2) X 2 = ?", "answer": ["2", "0", "4"], "correctIndex": 2],
        ["win": 10000, "id": 2, "question": "(2 + 2 X 2) / 2 = ?", "answer": ["3", "8", "6"], "correctIndex": 0],
        ["win": 10000, "id": 3, "question": "(2 / 2 + 2) + 2 = ?", "answer": ["4", "5", "2"], "correctIndex": 1],
    ]
    
    let gameArray100000 = [
        ["win": 100000, "id": 1, "question": "4 - (2 X 2 - 2) X 2 = ?", "answer": ["2", "0", "4"], "correctIndex": 1],
        ["win": 100000, "id": 2, "question": "4 - (2 + 2 X 2) / 2 = ?", "answer": ["4", "1", "6"], "correctIndex": 1],
        ["win": 100000, "id": 3, "question": "4 - (2 / 2 + 2) + 2 = ?", "answer": ["4", "5", "1"], "correctIndex": 2],
    ]
}

