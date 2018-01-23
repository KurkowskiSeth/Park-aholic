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
    let parkQualityTotalScore: Int
    let parkQualityTotalReviews: Int
    let parkEquipmentTotalScore: Int
    let parkEquipmentTotalReviews: Int
    let neighborhoodTotalScore: Int
    let neighborhoodTotalReviews: Int
    let overallEnjoymentTotalScore: Int
    let overallEnjoymentTotalReviews: Int
    let likelinessToReturnTotalScore: Int
    let likelinessToReturnTotalReviews: Int
    
    //Computed Properties
    var cityState: String {
        return city + ", " + state
    }
    var averageParkQualityRating: Int {
        return parkQualityTotalScore/parkQualityTotalReviews
    }
    var averageParkEquipmentRating: Int {
        return parkEquipmentTotalScore/parkEquipmentTotalReviews
    }
    var averageNeighborhoodRating: Int {
        return neighborhoodTotalScore/neighborhoodTotalReviews
    }
    var averageOverallEnjoymentRating: Int {
        return overallEnjoymentTotalScore/overallEnjoymentTotalReviews
    }
    var averageLikelinessToReturnRating: Int {
        return likelinessToReturnTotalScore/likelinessToReturnTotalReviews
    }
    
    //inits
    init(name: String, city: String, state: String, latitude: Double, longitude: Double, parkQualityTotalScore: Int, parkQualityTotalReviews: Int, parkEquipmentTotalScore: Int, parkEquipmentTotalReviews: Int, neighborhoodTotalScore: Int, neighborhoodTotalReviews: Int, overallEnjoymentTotalScore: Int, overallEnjoymentTotalReviews: Int, likelinessToReturnTotalScore: Int, likelinessToReturnTotalReviews: Int) {
        self.name = name
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        self.parkQualityTotalScore = parkQualityTotalScore
        self.parkQualityTotalReviews = parkQualityTotalReviews
        self.parkEquipmentTotalScore = parkEquipmentTotalScore
        self.parkEquipmentTotalReviews = parkEquipmentTotalReviews
        self.neighborhoodTotalScore = neighborhoodTotalScore
        self.neighborhoodTotalReviews = neighborhoodTotalReviews
        self.overallEnjoymentTotalScore = overallEnjoymentTotalScore
        self.overallEnjoymentTotalReviews = overallEnjoymentTotalReviews
        self.likelinessToReturnTotalScore = likelinessToReturnTotalScore
        self.likelinessToReturnTotalReviews = likelinessToReturnTotalReviews
    }
}
