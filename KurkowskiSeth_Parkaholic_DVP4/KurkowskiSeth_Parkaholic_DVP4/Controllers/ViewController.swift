//
//  ViewController.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/9/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //Park Properties
    var parkArray = [ParkDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        coreLocationManager.delegate = self
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        requestAuthorization()
        
    }
    
    //Set up table view cells and rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell1", for: indexPath) as? ParkCellTableViewCell
        
        cell?.lblParkName.text = parkArray[indexPath.row].name
        cell?.lblCityState.text = parkArray[indexPath.row].cityState
        
        return cell!
    }


}

