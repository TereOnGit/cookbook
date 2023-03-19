//
//  ReceptBox.swift
//  cookbook SwiftUI
//
//  Created by Terka on 12.03.2023.
//

import SwiftUI

struct ReceptBox: View {
    var recept: Recept
    
    var body: some View {
        VStack {
            recept.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                   
            Divider()
            
            Text(recept.name)
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .frame(width: 150, height: 100)
                .padding()
            
            }
        .overlay {
            RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1)
        }
    }
}

struct ReceptBox_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReceptBox(recept: recepts[0])
            ReceptBox(recept: recepts[1])
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
