//
//  AddNewParkToDatabase_EXT.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/18/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import Foundation
import Firebase

extension UserReview_ViewController {
    
    func checkForPark() {
        ref.child("parks").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(self.parkName) {
                //TODO - Update Park data
                self.addReviewToPark()
            } else {
                //Add park to database
                self.addNewParkToDatabase()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func addReviewToPark() {
        //Get total score and total reviews then update the child node
        ref.child("parks").child(parkName).child("0").child("averages").observeSingleEvent(of: .value, with: { (snapshot) in
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
            
            self.parkQualityTotalScore += parkQualityScore
            self.parkQualityTotalReviews += parkQualityReviews
            self.parkEquipmentTotalScore += parkEquipmentScore
            self.parkEquipmentTotalReviews += parkEquipmentReviews
            self.neighborhoodTotalScore += neighborhoodScore
            self.neighborhoodTotalReviews += neighborhoodReviews
            self.overallEnjoymentTotalScore += overallEjoymentScore
            self.overallEnjoymentTotalReviews += overallEnjoymentReviews
            self.likelinessToReturnTotalScore += likelinessToReturnScore
            self.likelinessToReturnTotalReviews += likelinessToReturnReviews
            
            //Update park in database
            self.ref.child("parks").child(self.parkName).child("0").child("averages").child("parkQuality").setValue(["totalRatings": self.parkQualityTotalReviews, "totalScore": self.parkQualityTotalScore])
            self.ref.child("parks").child(self.parkName).child("0").child("averages").child("parkEquipment").updateChildValues(["totalRatings": self.parkEquipmentTotalReviews, "totalScore": self.parkEquipmentTotalScore])
            self.ref.child("parks").child(self.parkName).child("0").child("averages").child("neighborhood").updateChildValues(["totalRatings": self.neighborhoodTotalReviews, "totalScore": self.neighborhoodTotalScore])
            self.ref.child("parks").child(self.parkName).child("0").child("averages").child("overallEnjoyment").updateChildValues(["totalRatings": self.overallEnjoymentTotalReviews, "totalScore": self.overallEnjoymentTotalScore])
            self.ref.child("parks").child(self.parkName).child("0").child("averages").child("likelinessToReturn").updateChildValues(["totalRatings": self.likelinessToReturnTotalReviews, "totalScore": self.likelinessToReturnTotalScore])

        }) { (error) in
            print(error.localizedDescription)
        }
                
    }
    
    func addNewParkToDatabase() {
        let newPark: [String : Any?] = [parkName:
            [
                ["averages":
                    ["parkQuality":
                        ["totalRatings": 1,
                         "totalScore": parkQualityTotalScore
                        ],
                     "parkEquipment":
                        ["totalRatings": 1,
                         "totalScore": parkEquipmentTotalScore
                        ],
                     "neighborhood":
                        ["totalRatings": 1,
                         "totalScore": neighborhoodTotalScore
                        ],
                     "overallEnjoyment":
                        ["totalRatings": 1,
                         "totalScore": overallEnjoymentTotalScore
                        ],
                     "likelinessToReturn":
                        ["totalRatings": 1,
                         "totalScore": likelinessToReturnTotalScore
                        ]
                    ]
                ],
                ["comments":
                    ["commentID":
                        ["name": "user1",
                         "text": "New park is cool"
                        ]
                    ]
                ],
                ["tags": ["baseball field", "playground", "sandbox"]]
            ]
        ]
        ref.child("parks").updateChildValues(newPark as Any as! [AnyHashable : Any])
    }
    
}
