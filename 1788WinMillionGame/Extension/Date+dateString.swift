//
//  Date+dateString.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 06.03.2022.
//

import Foundation

extension Date {
    
    func toString(format: String = "dd-MM-yyyy HH:mm") -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

