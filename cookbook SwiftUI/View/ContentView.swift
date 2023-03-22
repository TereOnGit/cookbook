//
//  ContentView.swift
//  cookbook SwiftUI
//
//  Created by Terka on 02.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ReceptCollection()
            .environmentObject(Storage())
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
