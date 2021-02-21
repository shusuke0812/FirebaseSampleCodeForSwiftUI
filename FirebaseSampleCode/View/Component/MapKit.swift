//
//  MapKit.swift
//  FirebaseSampleCode
//
//  Created by Shusuke Ota on 2020/6/8.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI
import MapKit

struct MapKit: UIViewRepresentable {
    
        var locationManager = CLLocationManager()
    
        func setupManager() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        }
    
        func makeUIView(context: Context) -> MKMapView {
            setupManager()
            
            let mapView = MKMapView(frame:  UIScreen.main.bounds)
            
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapKit>) {
        //func updateUIView(_ uiView: MKMapView, context: Context) {
            let coordinate = CLLocationCoordinate2D(latitude: 35.7618662, longitude: 139.5363992)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "test"
            // annotation.subtitle = eventData.place
            uiView.addAnnotation(annotation)
        }
}

struct MapKit_Previews: PreviewProvider {
    static var previews: some View {
        MapKit()
    }
}
