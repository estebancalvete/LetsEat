//
//  MapDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import Foundation
import MapKit

class MapDataManager: DataManager {
    private var items: [RestaurantItem] = []
    var annotations: [RestaurantItem] {
        items
    }
    
    func fetch(completion: (_ annotations: [RestaurantItem]) -> ()) {
        if !items.isEmpty {
            items.removeAll()
        }
        for data in loadPlist(file: "MapLocations") {
            items.append(RestaurantItem(dict: data))
        }
        completion(items)
    }
    
    func initialRegion(latDelta: CLLocationDegrees, longDelta: CLLocationDegrees) -> MKCoordinateRegion {
        guard let item = items.first else {
            return MKCoordinateRegion()
        }
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }
}
