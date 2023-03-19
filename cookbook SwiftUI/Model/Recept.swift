//
//  Recept.swift
//  cookbook SwiftUI
//
//  Created by Terka on 03.03.2023.
//

import Foundation
import SwiftUI

struct Recept: Identifiable, Codable, Hashable {
    
    var id: UUID
    var name: String
    var ingredients: String
    var process: String
    
    private var isSoup: Bool
    private var isMainDish: Bool
    
    private var imageName: String = ""
    var image: Image {
        Image(imageName)
    }
    
    init(id: UUID = .init(), name: String, ingredients: String, process: String, isSoup: Bool, isMainDish: Bool) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.process = process
        self.isSoup = isSoup
        self.isMainDish = isMainDish
      //  self.imageName = imageName
    }
}
