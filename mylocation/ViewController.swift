//
//  ViewController.swift
//  mylocation
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locatiomManager = CLLocationManager()
    
    @IBOutlet var latLabel : UILabel!
    @IBOutlet var longLabel : UILabel!
    
    @IBAction func getlocation(){
        locatiomManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //WAY1 : request for once
        locatiomManager.requestLocation()
        //WAY2 : continuous request
        //locatiomManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authState = CLLocationManager.authorizationStatus()
        if authState == .notDetermined {
        locatiomManager.requestWhenInUseAuthorization()
        }
        locatiomManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error!")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        if let location = locations.first {
            latLabel.text = "\(location.coordinate.latitude)"
            longLabel.text = "\(location.coordinate.longitude)"
        }
    }
}
