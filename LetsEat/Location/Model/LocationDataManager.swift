//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import Foundation

class LocationDataManager: DataManager {
    private var locations: [String] = []
    
    func fetch() {
        for location in loadPlist(file: "Locations") {
            if let city = location["city"], let state = location["state"] {
                locations.append("\(city), \(state)")
            }
        }
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index: Int) -> String {
        locations[index]
    }
}
