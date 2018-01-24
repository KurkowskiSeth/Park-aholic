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
    let city: String
    let state: String
    let latitude: Double
    let longitude: Double
    var parkQualityTotalScore: Int!
    var parkQualityTotalReviews: Int!
    var parkEquipmentTotalScore: Int!
    var parkEquipmentTotalReviews: Int!
    var neighborhoodTotalScore: Int!
    var neighborhoodTotalReviews: Int!
    var overallEnjoymentTotalScore: Int!
    var overallEnjoymentTotalReviews: Int!
    var likelinessToReturnTotalScore: Int!
    var likelinessToReturnTotalReviews: Int!
    
    //Computed Properties
    var cityState: String {
        return city + ", " + state
    }
    var averageParkQualityRating: Int {
        if parkQualityTotalReviews == 0 {
            return 0
        } else {
            return parkQualityTotalScore/parkQualityTotalReviews
        }
    }
    var averageParkEquipmentRating: Int {
        if parkEquipmentTotalReviews == 0 {
            return 0
        } else {
            return parkEquipmentTotalScore/parkEquipmentTotalReviews
        }
    }
    var averageNeighborhoodRating: Int {
        if neighborhoodTotalReviews == 0 {
            return 0
        } else {
            return neighborhoodTotalScore/neighborhoodTotalReviews
        }
    }
    var averageOverallEnjoymentRating: Int {
        if overallEnjoymentTotalReviews == 0 {
            return 0
        } else {
            return overallEnjoymentTotalScore/overallEnjoymentTotalReviews
        }
    }
    var averageLikelinessToReturnRating: Int {
        if likelinessToReturnTotalReviews == 0 {
            return 0
        } else {
            return likelinessToReturnTotalScore/likelinessToReturnTotalReviews
        }
    }
    var overallAverageRating: Int {
        return (averageParkQualityRating + averageParkEquipmentRating + averageNeighborhoodRating + averageOverallEnjoymentRating + averageLikelinessToReturnRating) / 5
    }
    
    //inits
    init(parkID: String, name: String, city: String, state: String, latitude: Double, longitude: Double, parkQualityTotalScore: Int = 0, parkQualityTotalReviews: Int = 0, parkEquipmentTotalScore: Int = 0, parkEquipmentTotalReviews: Int = 0, neighborhoodTotalScore: Int = 0, neighborhoodTotalReviews: Int = 0, overallEnjoymentTotalScore: Int = 0, overallEnjoymentTotalReviews: Int = 0, likelinessToReturnTotalScore: Int = 0, likelinessToReturnTotalReviews: Int = 0) {
        self.id = parkID
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
