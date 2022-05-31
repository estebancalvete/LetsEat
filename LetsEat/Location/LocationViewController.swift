//
//  LocationViewController.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate {
    
    let manager = LocationDataManager()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
}

// MARK: Private Extension

private extension LocationViewController {
    
    func initialize() {
        manager.fetch()
    }
    
}

// MARK: UITableViewDataSoruce

extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfLocationItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath.row)
        return cell
    }
}
