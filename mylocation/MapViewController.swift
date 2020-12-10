//
//  MapViewController.swift
//  mylocation
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var Mapview : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Mapview.delegate = self
        Mapview.showsUserLocation = true
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
}
