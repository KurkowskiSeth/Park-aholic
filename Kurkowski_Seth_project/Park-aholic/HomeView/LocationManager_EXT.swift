//
//  LocationManager_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import Foundation
import MapKit

extension ViewController {
    
    //Function to check authorization code and request authorization if it hasn't ben requested yet
    func requestAuthorization() {
        let authorizationCode = CLLocationManager.authorizationStatus()
        if authorizationCode == CLAuthorizationStatus.notDetermined && coreLocationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) || coreLocationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
            if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil {
                coreLocationManager.requestAlwaysAuthorization()
            }
        } else {
            //Start obtaining the user's location if they have already given permision to do so.
            coreLocationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.notDetermined || status != CLAuthorizationStatus.denied || status != CLAuthorizationStatus.restricted {
            coreLocationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if recentLocation == nil {
            recentLocation = locations.last
            updateMap(location: recentLocation)
            findParks()
        }
    }
    
    func updateMap(location: CLLocation) {
        //Region of mapView
        mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), MKCoordinateSpanMake(0, 0)), animated: true)
        mapView.showsUserLocation = true
    }
    
}
