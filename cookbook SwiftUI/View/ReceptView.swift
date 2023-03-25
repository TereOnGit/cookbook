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
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Button(action: {
                    showAlert = true})
                {Image(systemName: "xmark.bin.fill")
                }
                .foregroundColor(.white)
                .alert("Opravdu chcete smažat navždy?", isPresented: $showAlert) {
                    Button("Ano, smazat") {
                        storage.delete(recept: recept)
                    }
                    Button("Zpět") {
                        showAlert = false
                    }
                }
                .frame(width: 50, height: 50)
                .cornerRadius(16)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding()
            }
            
            Spacer()
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
    }
}

struct ReceptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceptView(recept: .mock1)
    }
}
