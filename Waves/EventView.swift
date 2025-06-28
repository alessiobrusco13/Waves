//
//  EventView.swift
//  Waves
//
//  Created by Alessio Garzia Marotta Brusco on 28/06/25.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        Image(.lunaRossa)
            .resizable()
            .frame(maxHeight: 800)
            .clipShape(.rect(cornerRadius: 20))
            .scaledToFit()
            .padding()
    }
}

#Preview {
    EventView()
}
