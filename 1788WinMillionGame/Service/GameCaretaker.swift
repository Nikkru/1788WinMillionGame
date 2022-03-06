//
//  GameCaretaker.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 02.03.2022.
//

import Foundation

//struct Record: Codable {
//
//    let date: Date
//    let value: Int
//}
//
//class RecordMemento {
//
////    var records: [Record]
//    init(records: [Record]) {
//        self.records = records
//    }
//    private let recordsCaretaker = RecordsCaretaker()
//    private(set) var records: [Record] {
//        didSet {
//            recordsCaretaker.saveRecord(records: self.records)
//        }
//    }
//    private init() {
//        self.records = self.recordsCaretaker.retrieveRecords()
//    }
//}

final class RecordsCaretaker<T: Codable> {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private var key: String { return String(describing: T.self) }
    
    func saveRecord(records: T) throws {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() throws -> T? {
        
        guard let data = UserDefaults.standard.value(forKey: key) as? Data,
              let decodeData = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return decodeData
    }
}

