//
//  EventsView.swift
//  Waves
//
//  Created by Alessio Garzia Marotta Brusco on 28/06/25.
//

import MapKit
import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationStack {
            List {
                Map(
                    initialPosition: MapCameraPosition.region(
                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.831944, longitude: 14.229444), span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    )
                )
                .frame(height: 300)
                .listRowBackground(EmptyView())
                .clipShape(.rect(cornerRadius: 20))
            }
        }
    }
}

#Preview {
    EventsView()
}
