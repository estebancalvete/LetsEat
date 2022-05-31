//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 27/5/22.
//

import Foundation

class ExploreDataManager: DataManager {
    private var exploreItems: [ExploreItem] = []
    
    func fetch() {
        for data in loadPlist(file: "ExploreData") {
            exploreItems.append(ExploreItem(dict: data as! [String: String]))
        }
    }
    
    func numberOfExploreElements() -> Int {
        exploreItems.count
    }
    
    func exploreItem(at index: Int) -> ExploreItem {
        exploreItems[index]
    }
}
