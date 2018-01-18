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
                print("park exits")
            } else {
                //Add park to database
                self.addNewParkToDatabase()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func addNewParkToDatabase() {
        let newPark: [String : Any?] = [parkName:
            [
                ["averages":
                    ["parkQuality":
                        ["totalRatings": parkQualityScore,
                         "totalScore": 1
                        ],
                     "parkEquipment":
                        ["totalRatings": parkEquipmentScore,
                         "totalScore": 1
                        ],
                     "neighborhood":
                        ["totalRatings": neighborhoodScore,
                         "totalScore": 1
                        ],
                     "overallEnjoyment":
                        ["totalRatings": overallEjoymentScore,
                         "totalScore": 1
                        ],
                     "likelinessToReturn":
                        ["totalRatings": likelinessToReturnScore,
                         "totalScore": 1
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
