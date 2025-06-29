//
//  ContentView.swift
//  Waves
//
//  Created by Alessio Garzia Marotta Brusco on 28/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var contents: [Int] {
        if searchText.isEmpty {
            Array(0..<200)
        } else {
            (0..<200)
                .filter { String($0).localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            MapView()
//                .navigationTitle("Mappa")
        }
        
    }
}

#Preview {
    ContentView()
}
