//
//  MapViewController.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    private let manager = MapDataManager()
    
    var selectedRestaurant: RestaurantItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
}

// MARK: Private Extension

private extension MapViewController {
    
    // (2) The fetch(completion:) method loads the MapLocations.plist file and creates and assigns the array of RestaurantItem instances to the items array. The annotations property returns a copy of the items array. This array is then processed by the setupMap(_:) method that was passed in as the completion closure.
    func initialize() {
        mapView.delegate = self
        manager.fetch { (annotations) in
            setupMap(annotations)
        }
    }
    
    // (1) This method takes a parameter, annotations, which is an array of RestaurantItem instances. It sets the region of the map to be displayed in the map view using the initialRegion(latDelta:longDelta:) method of the MapDataManager class, then adds each restaurantItem instance in the annotations array to the map view. The map view's delegate (the mapViewController class in this case) then automatically provides an MKAnnotationView instance for every RestaurantItem instance within the region.
    func setupMap(_ annotations: [RestaurantItem]) {
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.annotations)
    }
    
    func showRestaurantDetail(segue: UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantDetailViewController, let restaurant = selectedRestaurant {
            viewController.selectedRestaurant = restaurant
        }
    }
}

// MARK: MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "custompin"
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        let annotationView: MKAnnotationView
        if let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            annotationView = customAnnotationView
            annotationView.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        annotationView.canShowCallout = true
        if let image = UIImage(named: "custom-annotation") {
            annotationView.image = image
            annotationView.centerOffset = CGPoint(x: -image.size.width / 2, y: -image.size.height / 2)
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = mapView.selectedAnnotations.first else { return }
        selectedRestaurant = annotation as? RestaurantItem
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
}
