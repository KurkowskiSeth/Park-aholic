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
    let id: String
    let name: String
    let phoneNumber: String!
    let city: String
    let state: String
    let latitude: Double
    let longitude: Double
    
    //Computed Properties
    var cityState: String {
        return city + ", " + state
    }
    
    //inits
    init(id: String, name: String, phoneNumber: String!, city: String, state: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
    
    convenience init(id: String, name: String, city: String, state: String, latitude: Double, longitude: Double, phoneNumber: String? = nil) {
        self.init(id: id, name: name, phoneNumber: phoneNumber, city: city, state: state, latitude: latitude, longitude: longitude)
    }
}
