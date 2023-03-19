//
//  ReceptView.swift
//  cookbook SwiftUI
//
//  Created by Terka on 03.03.2023.
//

import SwiftUI

struct ReceptView: View {
    var recept: Recept
    
    var body: some View {
        ScrollView {
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
        ReceptView(recept: recepts[0])
    }
}
