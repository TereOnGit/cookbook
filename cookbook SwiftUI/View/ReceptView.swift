//
//  ReceptView.swift
//  cookbook SwiftUI
//
//  Created by Terka on 03.03.2023.
//

import SwiftUI

struct ReceptView: View {
    @EnvironmentObject var storage: Storage
    var recept: Recept
    
    @State private var showAlert = false
    @State private var sheetIsActive = false
    
    var body: some View {
        ScrollView {
            FoodImage(image: recept.image)
                .ignoresSafeArea(edges: .top)
            Text(recept.name)
                .font(.title)
                .padding(.all)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Ingredience:")
                    .font(.title2)
                    .padding(.bottom)
                Text(recept.ingredients)
                    .font(.body)
                    .padding(.bottom)
                Divider()
                Text("Postup: ")
                    .font(.title2)
                    .padding(.bottom)
                Text(recept.process)
                    .font(.body)
                Spacer()
            }
            .padding()
        }
        .alert("Opravdu chcete smažat navždy?", isPresented: $showAlert) {
            Button("Ano, smazat") {
                storage.delete(recept: recept)
            }
            Button("Zpět") {}
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    sheetIsActive = true
                } label: {
                    Image(systemName: "pencil.circle.fill")
                }
                .tint(.green)
                Button {
                    showAlert = true
                } label: {
                    Image(systemName: "trash.circle.fill")
                }
                .tint(.red)
            }
        }
    }
}

struct ReceptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceptView(recept: .mock1)
    }
}
