//
//  NewReceptView.swift
//  cookbook SwiftUI
//
//  Created by Terka on 14.03.2023.
//

import SwiftUI

struct NewReceptView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storage: Storage
    
    @State private var name: String = "..."
    @State private var ingredients: String = "..."
    @State private var process: String = "..."
    
    @State private var image = UIImage()
    @State private var showSheet = false
    @State var isSoup = false
    @State var isMainDish = false
    
    
    @State private var selectedType = Recept.ReceptType.soup
    
    var body: some View {
        VStack(){
            Text("Nový recept")
                .font(.title)
            Divider()
            
            Form {
                VStack(alignment: .leading) {
                    Text("Název receptu:")
                    TextEditor(text: $name)
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 30, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    Text("Ingredience:")
                    TextEditor(text: $ingredients)
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 80, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    Text("Popis postupu:")
                    TextEditor(text: $process)
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 130, alignment: .leading)
                }
                
                Picker("Typ jídla:", selection: $selectedType) {
                    Text("Hlavní chod").tag(Recept.ReceptType.mainDish)
                    Text("Polévka").tag(Recept.ReceptType.soup)
                }
                .pickerStyle(.segmented)
                
            }
            ._scrollable()
            .disableAutocorrection(true)
            
            Divider()
            
            HStack{
                Image(uiImage: self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50)
                    .padding(.all, 4)
                    .frame(width: 100, height: 70)
                    .background(Color.black.opacity(0.1))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .padding(8)
                    .onTapGesture {
                        showSheet = true
                    }
                
                Text("Vybrat fotku z galerie")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(16)
                    .foregroundColor(.black)
                    .onTapGesture {
                        showSheet = true
                    }
                
            }
            
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                
                // příp. ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
            Divider()
            
            Button("Uložit") {
                let recept = Recept(
                    name: name,
                    ingredients: ingredients,
                    process: process,
                    type: isMainDish ? . mainDish : .soup
                )
                storage.add(newRecept: recept)
                dismiss()
            }
                .font(.title)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .cornerRadius(16)
                .foregroundColor(.white)
                .background(.mint)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .padding()
            
        }
        
        .padding()
        
    }
}


struct NewReceptView_Previews: PreviewProvider {
    static var previews: some View {
        NewReceptView()
    }
}
