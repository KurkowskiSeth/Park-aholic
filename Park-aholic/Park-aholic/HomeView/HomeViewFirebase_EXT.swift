//
//  HomeViewFirebase_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/23/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import Firebase

extension ViewController {
    
    func addNewParkToDatabase(parkID: String, parkName: String) {
        let newPark: [String : Any?] = [parkID:
            [
                "parkName": parkName,
                "averages":
                    ["parkQuality":
                        ["totalRatings": 0,
                         "totalReviews": 0
                        ],
                     "parkEquipment":
                        ["totalRatings": 0,
                         "totalReviews": 0
                        ],
                     "neighborhood":
                        ["totalRatings": 0,
                         "totalReviews": 0
                        ],
                     "overallEnjoyment":
                        ["totalRatings": 0,
                         "totalReviews": 0
                        ],
                     "likelinessToReturn":
                        ["totalRatings": 0,
                         "totalReviews": 0
                        ]
                    ],
                "comments": "nil",
                "tags": "nil"
                ]
        ]
        ref.child("parks").updateChildValues(newPark as Any as! [AnyHashable : Any])
    }
    
}
