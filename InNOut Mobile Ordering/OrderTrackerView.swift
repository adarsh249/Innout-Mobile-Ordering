//
//  OrderTrackerView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 12/20/22.
//

import SwiftUI
import MapKit
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enable user locatoin tracking and center the map on user's location
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //request location access when the view appears
        locationManager.requestWhenInUseAuthorization()
    }
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        mapView.frame = view.bounds
        mapView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(mapView)
    }
    
    @IBAction func closeMapButtonTapped(_ sender: Any) {
        mapView.removeFromSuperview()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let accuracyAuthorization = manager.accuracyAuthorization
        
        switch accuracyAuthorization {
        case .fullAccuracy:
            break
        case .reducedAccuracy:
            manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "For Delivery")
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //get latest location
        guard let location = locations.last else {return}
        
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
}
