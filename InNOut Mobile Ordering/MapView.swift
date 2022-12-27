//
//  MapView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 12/26/22.
//

import MapKit
import CoreLocation
import SwiftUI

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    var showingUserLocation = false

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        showingUserLocation = true
    }
}

struct MapView: View {
    @State private var showingUserLocation = false
    let locationManager = CLLocationManager()
    let locationManagerDelegate = LocationManagerDelegate()

    var body: some View {
        MapKitMapView(coordinateRegion: .constant(MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.locationManager.delegate = self.locationManagerDelegate
                self.locationManager.requestWhenInUseAuthorization()
                self.locationManager.startUpdatingLocation()
            }
    }
}

struct MapKitMapView: UIViewRepresentable {
    @Binding var coordinateRegion: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(coordinateRegion, animated: true)
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
