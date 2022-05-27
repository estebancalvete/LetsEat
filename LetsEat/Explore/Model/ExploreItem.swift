//
//  ExploreItem.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 27/5/22.
//

import Foundation

struct ExploreItem {
    let name: String?
    let image: String?
}

extension ExploreItem {
    init(dict: [String: String]) {
        self.name = dict["name"]
        self.image = dict["image"]
    }
}
