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
        TabView {
            Tab("Events", systemImage: "sailboat") {
                EventsView()
            }
            
            Tab("Favorites", systemImage: "star") {
                
            }
            
            Tab(role: .search) {
                NavigationStack {
                    List(contents, id: \.self) { i in
                        Text(i.formatted())
                            .searchable(text: $searchText)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
