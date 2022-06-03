//
//  FilterDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 3/6/22.
//

import Foundation

class FilterDataManager: DataManager {
    func fetch() -> [FilterItem] {
        var filterItems: [FilterItem] = []
        for data in loadPlist(file: "FilterData") {
            filterItems.append(FilterItem(dict: data as! [String: String]))
        }
        return filterItems
    }
}
