//
//  PointOfInterest.swift
//  Waves
//
//  Created by Alessio Garzia Marotta Brusco on 29/06/25.
//

import Foundation
import MapKit

struct PointOfInterest: Identifiable {
    enum CrowdLevel: CustomStringConvertible {
        case low, medium, high
        
        var description: String {
            switch self {
            case .low: "Poco affollato"
            case .medium: "Mediamente affollato"
            case .high: "Molto affollato"
            }
        }
    }
    
    let id = UUID()
    let name: String
    let distanceFromCurrentPosition: Double
    let coordinates: CLLocationCoordinate2D
    let crowdLevel: CrowdLevel
    
    static let sampleData = [
        PointOfInterest(
            name: "Via San Pasquale",
            distanceFromCurrentPosition: 0.2,
            coordinates: CLLocationCoordinate2D(latitude: 40.834230, longitude: 14.242590),
            crowdLevel: .low
        ),
        PointOfInterest(
            name: "Piazza Vittoria",
            distanceFromCurrentPosition: 0.3,
            coordinates: CLLocationCoordinate2D(latitude: 40.832894, longitude: 14.246813),
            crowdLevel: .medium
        ),
        PointOfInterest(
            name: "Castel dell'Ovo",
            distanceFromCurrentPosition: 0.5,
            coordinates: CLLocationCoordinate2D(latitude: 40.830271, longitude: 14.248571),
            crowdLevel: .high
        ),
        PointOfInterest(
            name: "Rotonda Diaz",
            distanceFromCurrentPosition: 0.7,
            coordinates: CLLocationCoordinate2D(latitude: 40.826100, longitude: 14.239754),
            crowdLevel: .low
        ),
        PointOfInterest(
            name: "Via Partenope",
            distanceFromCurrentPosition: 0.4,
            coordinates: CLLocationCoordinate2D(latitude: 40.830900, longitude: 14.247700),
            crowdLevel: .medium
        ),
        PointOfInterest(
            name: "Mappatella Beach",
            distanceFromCurrentPosition: 0.9,
            coordinates: CLLocationCoordinate2D(latitude: 40.825524, longitude: 14.238585),
            crowdLevel: .high
        )
    ]
}
