//
//  FilterItem.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 3/6/22.
//

import Foundation

struct FilterItem {
    var filter: String?
    var name: String?
    
    init(dict: [String: String]) {
        self.filter = dict["filter"]
        self.name = dict["name"]
    }
}

