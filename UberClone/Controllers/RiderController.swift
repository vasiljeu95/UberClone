//
//  RiderController.swift
//  UberClone
//
//  Created by Stepan Vasiljeu on 2/18/19.
//  Copyright © 2019 Stepan Vasiljeu. All rights reserved.
//

import UIKit
import MapKit

class RiderController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var callAnUberButton: UIButton!
    
    var locationManager = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func callUberTapped(_ ender: Any) {
        
    }
    
    @IBAction func logoutTapped(_ ender: Any) {
        
    }
    
}
