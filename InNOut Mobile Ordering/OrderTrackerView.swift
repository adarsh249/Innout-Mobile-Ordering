//
//  OrderTrackerView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 12/19/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct OrderTrackerView: View {
    var body: some View {
        class ViewController: UIViewController, CLLocationManagerDelegate {
            let locationManager = CLLocationManager()
            let mapView = MKMapView()
            
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            
            func locationManager(_manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                if status == .authorizedWhenInUse {
                    locationManager.startUpdatingLocation()
                }
            }
            
            func locationManager(_manager: CLLocationManager, didUpdateLocations: [CLLocation]) {
                if let location = locations.first {
                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: location.coordinate, span: span)
                    mapView.setRegion(region, animated: true)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location.coordinate
                    mapView.addAnnotation(annotation)
                }
            }
            addSubview(mapView)
        }

    }
}

struct OrderTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTrackerView()
    }
}
