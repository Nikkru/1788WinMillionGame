//
//  GameCaretaker.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 02.03.2022.
//

import Foundation

struct Record: Codable {
    
    let date: Date
    let value: Int
}

class RecordMomento {
    
//    var records: [Record]
    init(records: [Record]) {
        self.records = records
    }
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
}

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

