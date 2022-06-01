//
//  LocationItem.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 1/6/22.
//

import Foundation

struct LocationItem: Equatable {
    var city: String?
    var state: String?
}

extension LocationItem {
    init(dict: [String: String]) {
        self.city = dict["city"]
        self.state = dict["state"]
    }
    
    var cityAndState: String {
        guard let city = self.city, let state = self.state else { return "" }
        return "\(city), \(state)"
    }
}
