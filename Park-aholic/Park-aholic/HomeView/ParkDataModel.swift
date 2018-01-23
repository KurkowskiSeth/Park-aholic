//
//  ParkDataModel.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/11/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import Foundation

class ParkDataModel {
    //Stored Properties
    let name: String
    let city: String
    let state: String
    let latitude: Double
    let longitude: Double
    
    //Computed Properties
    var cityState: String {
        return city + ", " + state
    }
    
    //inits
    init(name: String, city: String, state: String, latitude: Double, longitude: Double) {
        self.name = name
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
}
