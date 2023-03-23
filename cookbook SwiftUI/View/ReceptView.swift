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
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Button("Smazat recept") {
                    storage.delete(recept: recept)
                }
                .font(.body)
                .frame(width: 100, height: 50)
                .cornerRadius(16)
                .foregroundColor(.white)
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
