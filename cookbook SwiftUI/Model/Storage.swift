//
//  Storage.swift
//  cookbook SwiftUI
//
//  Created by Terka on 16.03.2023.
//

import Combine
import Foundation

class Storage: ObservableObject {
    @Published var recepts: [Recept] = [] {
        didSet {
            save()
        }
    }
    
    private let fileManager: FileManager
    
    init() {
        fileManager = .default
        load()
    }
    
    func load() {
        let url = makeURL(forFileNamed: "mojedata.json")!
        guard let data = try? Data(contentsOf: url) else {
            recepts = decodeDefaultData()
            return
        }
        do {
            let decoder = JSONDecoder()
            recepts = try decoder.decode([Recept].self, from: data)
        } catch {
            recepts = decodeDefaultData()
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(recepts)
            try save(fileNamed: "mojedata.json", data: data)
        } catch {}
    }
    
    func add(newRecept: Recept) {
        recepts = recepts + [newRecept]
    }
    
    func delete(recept: Recept) {
        recepts = recepts.filter() {
            $0 != recept
        }
    }
    
    enum Error: Swift.Error {
        case fileAlreadyExists
        case invalidDirectory
        case writtingFailed
    }
    
    private func save(fileNamed: String, data: Data) throws {
        guard let url = makeURL(forFileNamed: fileNamed) else {
            throw Error.invalidDirectory
        }
        if fileManager.fileExists(atPath: url.absoluteString) {
            throw Error.fileAlreadyExists
        }
        do {
            try data.write(to: url)
        } catch {
            debugPrint(error)
            throw Error.writtingFailed
        }
    }
    private func makeURL(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }
    
    private func decodeDefaultData() -> [Recept] {
        let data: Data
        let filename = "receptData.json"
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could't load \(filename) from main bundle.")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Recept].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename).")
        }
    }
}
