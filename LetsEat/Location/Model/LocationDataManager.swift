//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import Foundation

class LocationDataManager: DataManager {
    private var locations: [LocationItem] = []
    
    func fetch() {
        for location in loadData() {
            locations.append(LocationItem(dict: location))
        }
    }
    
    func loadData() -> [[String: String]] {
        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),
              let itemsData = FileManager.default.contents(atPath: path),
              let items = try! PropertyListSerialization.propertyList(from: itemsData, format: nil) as? [[String: String]] else {
                  return [[:]]
              }
        return items
    }
    
    func numberOfLocationItems() -> Int {
        locations.count
    }
    
    func locationItem(at index: Int) -> LocationItem {
        locations[index]
    }
}
