//
//  Storage.swift
//  cookbook SwiftUI
//
//  Created by Terka on 16.03.2023.
//

import Combine
import Foundation

class Storage: ObservableObject{
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
        let url = makeURL(forFileNamed: "mojedata.txt")!
        if fileManager.fileExists(atPath: url.absoluteString) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                recepts = try decoder.decode([Recept].self, from: data)
            } catch {
                recepts = []
            }
        } else {
            recepts = []
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(recepts)
            try save(fileNamed: "mojedata.txt", data: data)
        } catch {}
    }
    
    func add(newRecept: Recept) {
        recepts = recepts + [newRecept]
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
}
