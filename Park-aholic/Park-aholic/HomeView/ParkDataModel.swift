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
    var parkQualityTotalRatings: Int!
    var parkQualityTotalReviews: Int!
    var parkEquipmentTotalRatings: Int!
    var parkEquipmentTotalReviews: Int!
    var neighborhoodTotalRatings: Int!
    var neighborhoodTotalReviews: Int!
    var overallEnjoymentTotalRatings: Int!
    var overallEnjoymentTotalReviews: Int!
    var likelinessToReturnTotalRatings: Int!
    var likelinessToReturnTotalReviews: Int!
    var commentsArray: [[String: String]]!
    
    //Computed Properties
    var cityState: String {
        return city + ", " + state
    }
    var averageParkQualityRating: Int {
        if parkQualityTotalReviews == 0 {
            return 0
        } else {
            return parkQualityTotalRatings/parkQualityTotalReviews
        }
    }
    var averageParkEquipmentRating: Int {
        if parkEquipmentTotalReviews == 0 {
            return 0
        } else {
            return parkEquipmentTotalRatings/parkEquipmentTotalReviews
        }
    }
    var averageNeighborhoodRating: Int {
        if neighborhoodTotalReviews == 0 {
            return 0
        } else {
            return neighborhoodTotalRatings/neighborhoodTotalReviews
        }
    }
    var averageOverallEnjoymentRating: Int {
        if overallEnjoymentTotalReviews == 0 {
            return 0
        } else {
            return overallEnjoymentTotalRatings/overallEnjoymentTotalReviews
        }
    }
    var averageLikelinessToReturnRating: Int {
        if likelinessToReturnTotalReviews == 0 {
            return 0
        } else {
            return likelinessToReturnTotalRatings/likelinessToReturnTotalReviews
        }
    }
    var overallAverageRating: Int {
        return (averageParkQualityRating + averageParkEquipmentRating + averageNeighborhoodRating + averageOverallEnjoymentRating + averageLikelinessToReturnRating) / 5
    }
    
    //inits
    init(parkID: String, name: String, city: String, state: String, latitude: Double, longitude: Double, parkQualityTotalRatings: Int = 0, parkQualityTotalReviews: Int = 0, parkEquipmentTotalRatings: Int = 0, parkEquipmentTotalReviews: Int = 0, neighborhoodTotalRatings: Int = 0, neighborhoodTotalReviews: Int = 0, overallEnjoymentTotalRatings: Int = 0, overallEnjoymentTotalReviews: Int = 0, likelinessToReturnTotalRatings: Int = 0, likelinessToReturnTotalReviews: Int = 0, commentsDict: [[String: String]] = [[:]]) {
        self.id = parkID
        self.name = name
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
        self.parkQualityTotalRatings = parkQualityTotalRatings
        self.parkQualityTotalReviews = parkQualityTotalReviews
        self.parkEquipmentTotalRatings = parkEquipmentTotalRatings
        self.parkEquipmentTotalReviews = parkEquipmentTotalReviews
        self.neighborhoodTotalRatings = neighborhoodTotalRatings
        self.neighborhoodTotalReviews = neighborhoodTotalReviews
        self.overallEnjoymentTotalRatings = overallEnjoymentTotalRatings
        self.overallEnjoymentTotalReviews = overallEnjoymentTotalReviews
        self.likelinessToReturnTotalRatings = likelinessToReturnTotalRatings
        self.likelinessToReturnTotalReviews = likelinessToReturnTotalReviews
        self.commentsArray = commentsDict
    }
}
