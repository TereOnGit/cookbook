//
//  EditDetailView.swift
//  cookbook SwiftUI
//
//  Created by Terka on 06.04.2023.
//

import SwiftUI

struct EditReceptView: View {
    @EnvironmentObject var storage: Storage
    var recept: Recept
    
    @State private var id: UUID
    @State private var name: String
    @State private var ingredients: String
    @State private var process: String
    @State private var type: Recept.ReceptType
    
    
    init(recept: Recept) {
        self.recept = recept
        id = recept.id
        name = recept.name
        ingredients = recept.ingredients
        process = recept.process
        type = recept.type
    }
    
    var body: some View {
        ScrollView {
            FoodImage(image: recept.image)
                .ignoresSafeArea(edges: .top)
            TextEditor(text: $name)
                .font(.title)
                .padding(.all)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Ingredience:")
                    .font(.title2)
                    .padding(.bottom)
                TextEditor(text: $ingredients)
                    .font(.body)
                    .padding(.bottom)
                Divider()
                Text("Postup: ")
                    .font(.title2)
                    .padding(.bottom)
                TextEditor(text: $process)
                    .font(.body)
                Spacer()
            }
            .padding()
        }
    }
}

struct EditReceptView_Previews: PreviewProvider {
    static var previews: some View {
        EditReceptView(recept: .mock1)
    }
}
