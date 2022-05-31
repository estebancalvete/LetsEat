//
//  RestaurantItem.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import UIKit
import MapKit

class RestaurantItem: NSObject, MKAnnotation {
    let name: String?
    let cuisines: [String]
    let lat: Double?
    let lon: Double?
    let address: String?
    let postalCode: String?
    let state: String?
    let imageURL: String?
    let restaurantID: Int?
    
    init(dict: [String: AnyObject]) {
        self.lat = dict["lat"] as? Double
        self.lon = dict["long"] as? Double
        self.name = dict["name"] as? String
        self.cuisines = dict["cuisines"] as? [String] ?? []
        self.address = dict["address"] as? String
        self.postalCode = dict["postalCode"] as? String
        self.state = dict["state"] as? String
        self.imageURL = dict["image_url"] as? String
        self.restaurantID = dict["id"] as? Int
    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let lat = lat, let lon = lon else {
            return CLLocationCoordinate2D()
        }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
    var title: String? {
        name
    }
    
    var subtitle: String? {
        if cuisines.isEmpty {
            return ""
        } else if cuisines.count == 1 {
            return cuisines.first
        } else {
            return cuisines.joined(separator: ", ")
        }
    }
}

