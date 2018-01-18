//
//  ParkDetailPageStarsCreation_EXT.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/18/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ParkDetail_ViewController {
    
    //Get park's data from firebase
    func pullFirebaseData() {
        ref.child("parks").child((parkDetails?.name)!).child("0").child("averages").observe(.value, with: { (snapshot) in
            guard let value = snapshot.value as? NSDictionary,
                let parkQualityDict = value["parkQuality"] as? NSDictionary,
                let parkQualityScore = parkQualityDict["totalScore"] as? Int,
                let parkQualityReviews = parkQualityDict["totalRatings"] as? Int,
                let parkEquipmentDict = value["parkEquipment"] as? NSDictionary,
                let parkEquipmentScore = parkEquipmentDict["totalScore"] as? Int,
                let parkEquipmentReviews = parkEquipmentDict["totalRatings"] as? Int,
                let neighborhoodDict = value["neighborhood"] as? NSDictionary,
                let neighborhoodScore = neighborhoodDict["totalScore"] as? Int,
                let neighborhoodReviews = neighborhoodDict["totalRatings"] as? Int,
                let overallEnjoymentDict = value["overallEnjoyment"] as? NSDictionary,
                let overallEjoymentScore = overallEnjoymentDict["totalScore"] as? Int,
                let overallEnjoymentReviews = overallEnjoymentDict["totalRatings"] as? Int,
                let likelinessToReturnDict = value["likelinessToReturn"] as? NSDictionary,
                let likelinessToReturnScore = likelinessToReturnDict["totalScore"] as? Int,
                let likelinessToReturnReviews = likelinessToReturnDict["totalRatings"] as? Int
                else {print("Error in addReviewToPark guard statement"); return}
            
            //Update current averages
            self.averageParkQualityScore = parkQualityScore / parkQualityReviews
            self.averageParkEquipmentScore = parkEquipmentScore / parkEquipmentReviews
            self.averageNeighborhoodScore = neighborhoodScore / neighborhoodReviews
            self.averageOverallEnjoymentScore = overallEjoymentScore / overallEnjoymentReviews
            self.averageLikelinessToReturnScore = likelinessToReturnScore / likelinessToReturnReviews
            
            //Update UI
            self.createScrollView()
            
        })
    }
    
}
