//
//  Recept.swift
//  cookbook SwiftUI
//
//  Created by Terka on 03.03.2023.
//

import Foundation
import SwiftUI

struct Recept: Identifiable, Codable, Hashable {
    
    enum ReceptType: String, Codable, CaseIterable {
        case soup, mainDish
        
    }
    
    var id: UUID
    var name: String
    var ingredients: String
    var process: String
    
    var type: ReceptType
    
    private var imageName: String?
    var image: Image {
        Image(imageName ?? "image")
    }
    
    init(id: UUID = .init(), name: String, ingredients: String, process: String, type: ReceptType, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.process = process
        self.type = type
        self.imageName = imageName
    }
}

extension Recept {
    static let mock1 = Recept(
        name: "Mock recept",
        ingredients: "Ingredients",
        process: "Process",
        type: .mainDish
    )
}
