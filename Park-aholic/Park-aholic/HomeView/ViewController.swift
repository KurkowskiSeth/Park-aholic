//
//  ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    //Firebase Properties
    
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //General Properties
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up delegates
        coreLocationManager.delegate = self
        mapView.delegate = self
//        tableView.delegate = self
//        tableView.dataSource = self
        
        //Request user's location
        requestAuthorization()
    }
    
}
