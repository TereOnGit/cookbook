//
//  ReceptList.swift
//  cookbook SwiftUI
//
//  Created by Terka on 12.03.2023.
//

import SwiftUI

struct ReceptCollection: View {
    @EnvironmentObject var storage: Storage
    
    let columns: [GridItem] = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, content: {
                    ForEach(storage.recepts) { recept in
                        NavigationLink(destination: {
                            ReceptView(recept: recept)
                        }, label: {
                            ReceptBox(recept: recept)
                        })
                            .tint(.black)
                    }
                })
            }
            .toolbar {
                NavigationLink(destination: {
                    NewReceptView()
                }, label: {
                    Image(systemName: "plus")
                })
                    .tint(.black)
            .navigationTitle("Recepty")
            }
        }
    }
}

struct ReceptCollection_Previews: PreviewProvider {
    static var previews: some View {
        ReceptCollection()
            .environmentObject(Storage())
    }
}
