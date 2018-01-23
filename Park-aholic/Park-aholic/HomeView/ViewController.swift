//
//  ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    //Firebase Properties
    
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //General Properties
    var parkArray = [ParkDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up delegates
        coreLocationManager.delegate = self
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //Request user's location
        requestAuthorization()
    }
    
    //Send park data model forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ParkDetail_ViewController
        destination?.parkData = parkArray[(tableView.indexPathForSelectedRow?.row)!]
    }
    
}

