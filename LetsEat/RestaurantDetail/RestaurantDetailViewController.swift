//
//  RestaurantDetailTableViewController.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 31/5/22.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
    }

}
