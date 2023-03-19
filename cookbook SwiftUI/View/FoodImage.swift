//
//  FoodImage.swift
//  cookbook SwiftUI
//
//  Created by Terka on 02.03.2023.
//

import SwiftUI

struct FoodImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
            .shadow(radius: 7)
    }
}

struct FoodImage_Previews: PreviewProvider {
    static var previews: some View {
        FoodImage(image: Image("kureNaSmetane"))
    }
}
