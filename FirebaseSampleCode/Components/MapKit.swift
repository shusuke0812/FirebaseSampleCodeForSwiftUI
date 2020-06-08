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
    
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView(frame: .zero)
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapKit>) {
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
