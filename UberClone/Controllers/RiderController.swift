//
//  RiderController.swift
//  UberClone
//
//  Created by Stepan Vasiljeu on 2/18/19.
//  Copyright © 2019 Stepan Vasiljeu. All rights reserved.
//

import UIKit
import MapKit

class RiderController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var callAnUberButton: UIButton!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let cord = manager.location?.coordinate {
            let center = CLLocationCoordinate2D(latitude: cord.latitude, longitude: cord.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            map.setRegion(region, animated: true)
            
        }
    }
    
    @IBAction func callUberTapped(_ ender: Any) {
        
    }
    
    @IBAction func logoutTapped(_ ender: Any) {
        
    }
    
}
