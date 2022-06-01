//
//  RestaurantItem.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import UIKit
import MapKit

class RestaurantItem: NSObject, MKAnnotation, Decodable {
    let name: String?
    let cuisines: [String]
    let lat: Double?
    let lon: Double?
    let address: String?
    let postalCode: String?
    let state: String?
    let imageURL: String?
    let restaurantID: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case cuisines
        case lat
        case lon = "long"
        case address
        case postalCode = "postal_code"
        case state
        case imageURL = "image_url"
        case restaurantID = "id"
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

