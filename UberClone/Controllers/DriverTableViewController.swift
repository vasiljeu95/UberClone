//
//  DriverTableViewController.swift
//  UberClone
//
//  Created by Stepan Vasiljeu on 3/2/19.
//  Copyright © 2019 Stepan Vasiljeu. All rights reserved.
//

import UIKit
import Firebase

class DriverTableViewController: UITableViewController {

    var rideReqests : [DataSnapshot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Database.database().reference().child("Ride Reqests").observe(.childAdded) { (snapshot) in
            self.rideReqests.append(snapshot)
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideReqests.count
    }

    @IBAction func logoutTapped(_ sender: Any) {
        try? Auth.auth().signOut()
        navigationController?.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rideReqestCell", for: indexPath)
        let snapshot = rideReqests[indexPath.row]
        if let rideRequestDictionary = snapshot.value as? [String:AnyObject] {
            if let email = rideRequestDictionary["email"] as? String {
                cell.textLabel?.text = "HEllo!"
            }
        }
        return cell
    }
}
