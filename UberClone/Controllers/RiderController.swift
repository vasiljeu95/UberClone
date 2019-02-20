//
//  RiderController.swift
//  UberClone
//
//  Created by Stepan Vasiljeu on 2/18/19.
//  Copyright © 2019 Stepan Vasiljeu. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

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
            map.removeAnnotations(map.annotations)
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            annotation.title = "Your Location"
            map.addAnnotation(annotation)
        }
    }
    
    @IBAction func callUberTapped(_ ender: Any) {
        let rideRequestDictionary: [String:Any] = ["email":"rider@gmail.com", "lat":10, "lon":15]
        Database.database().reference().child("RideRequests").childByAutoId().setValue(<#T##value: Any?##Any?#>)
    }
    
    @IBAction func logoutTapped(_ ender: Any) {
        
    }
    
}
