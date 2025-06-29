//
//  MapView.swift
//  Waves
//
//  Created by Alessio Garzia Marotta Brusco on 29/06/25.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var selectedPoint: UUID? = PointOfInterest.sampleData.first!.id
    
    let userLocation = CLLocationCoordinate2D(latitude: 40.832400, longitude: 14.243900)
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.832400, longitude: 14.243900),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    @State private var route: MKRoute?
    
    var body: some View {
        ScrollView {
            Map(position: $position) {
                if let route {
                    MapPolyline(route)
                }
                
                Annotation("User", coordinate: userLocation, accessoryAnchor: .center) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 24, height: 24)
                        
                        Circle()
                            .fill(.accent)
                            .frame(width: 18, height: 18)
                    }
                }
                .annotationTitles(.hidden)
                
                ForEach(PointOfInterest.sampleData) { point in
                    Marker(point.name, coordinate: point.coordinates)
                        .tint(point.id == selectedPoint ? .accent : .gray)
                }
            }
            .frame(height: 400)
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            .disabled(true)
            
            ForEach(PointOfInterest.sampleData) { point in
                HStack(alignment: .firstTextBaseline) {
                    VStack(alignment: .leading) {
                        Text(point.name)
                            .font(.title)
                            .fontWeight(.medium)
                        
                        Text(point.crowdLevel.description)
                    }
                    
                    Spacer()
                    
                    Text(
                        Measurement(
                            value: point.distanceFromCurrentPosition,
                            unit: UnitLength.kilometers
                        ).formatted()
                    )
                    .font(.title)
                    .fontWeight(.medium)
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .padding()
                .background(selectedPoint == point.id ? .accent : .gray)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal)
            }
        }
        .task {
            route = await getDirections()
        }
    }
    
    func getDirections() async -> MKRoute? {
        let sourcePlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark   = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.834230, longitude: 14.242590))
        let sourceItem      = MKMapItem(placemark: sourcePlacemark)
        let destItem        = MKMapItem(placemark: destPlacemark)
        
        let request = MKDirections.Request()
        request.source = sourceItem
        request.destination = destItem
        request.transportType = .walking
        request.requestsAlternateRoutes = false
        
        do {
            let directions = MKDirections(request: request)
            let response   = try await directions.calculate()
            return response.routes.first
        } catch {
            print("Directions error: \(error.localizedDescription)")
            return nil
        }
    }
}

#Preview {
    MapView()
}
