//
//  apiPull_Ext.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/9/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import Foundation
import MapKit

private let clientID = "J3UDTOHW2TE3PQXM0RBV1S1V4BTPM3XDHDE41LIO3OBA4ZMP"
private let clientSecret = "DFFGNDPTQGR2VWTR2DQWSIDFMM1OWWQ2PAGD3ZURR5B4UIL2"

extension ViewController {
    
    func findParks() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        if let validURL = URL(string: "https://api.foursquare.com/v2/venues/search/?ll=\(recentLocation.coordinate.latitude),\(recentLocation.coordinate.longitude)&categoryId=4bf58dd8d48988d163941735&client_id=\(clientID)&client_secret=\(clientSecret)&v=20180111") {
            
            let task = session.dataTask(with: validURL, completionHandler: { (data, urlResponse, error) in
                if error != nil {return}
                
                guard let response = urlResponse as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else {return}
                
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as Any? {
                        guard let json = jsonObject as? [String: Any],
                        let response = json["response"] as? [String: Any],
                        let venues = response["venues"] as? [Any]
                            else{print("Error in apiPull_EXT first guard statement"); return}
                        print()
                        for venue in venues {
                            guard let park = venue as? [String: Any],
                            let parkName = park["name"] as? String,
                            let location = park["location"] as? [String: Any],
                            let lat = location["lat"] as? Double,
                            let lng = location["lng"] as? Double,
                            let city = location["city"] as? String,
                            let state = location["state"] as? String
                                else{print("No data found in first object array."); return}
                            
                            //Check to see if park is in database
                            self.ref.child("parks").observeSingleEvent(of: .value, with: { (snapshot) in
                                if snapshot.hasChild(parkName) == false {
                                    self.addNewParkToDatabase(parkName: parkName)
                                }
                            })
                            
                            //Pull from the database the park needed to be added
                            self.ref.child("parks").child(parkName).child("0").child("averages").observeSingleEvent(of: .value, with: { (snapshot) in
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
                                
                                self.parkArray.append(ParkDataModel(name: parkName, city: city, state: state, latitude: lat, longitude: lng, parkQualityTotalScore: parkQualityScore, parkQualityTotalReviews: parkQualityReviews, parkEquipmentTotalScore: parkEquipmentScore, parkEquipmentTotalReviews: parkEquipmentReviews, neighborhoodTotalScore: neighborhoodScore, neighborhoodTotalReviews: neighborhoodReviews, overallEnjoymentTotalScore: overallEjoymentScore, overallEnjoymentTotalReviews: overallEnjoymentReviews, likelinessToReturnTotalScore: likelinessToReturnScore, likelinessToReturnTotalReviews: likelinessToReturnReviews))
                            })
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.addParksToMap()
                    self.tableView.reloadData()
                }
            })
            task.resume()
        }
    }
    
    
    //Place parks onto map
    func addParksToMap() {
        for park in parkArray {
            let pinCoord = CLLocationCoordinate2D(latitude: park.latitude, longitude: park.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = pinCoord
            annotation.title = park.name
            
            mapView.addAnnotation(annotation)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }
    
    func addNewParkToDatabase(parkName: String) {
        let newPark: [String : Any?] = [parkName:
            [
                ["averages":
                    ["parkQuality":
                        ["totalRatings": 0,
                         "totalScore": 0
                        ],
                     "parkEquipment":
                        ["totalRatings": 0,
                         "totalScore": 0
                        ],
                     "neighborhood":
                        ["totalRatings": 0,
                         "totalScore": 0
                        ],
                     "overallEnjoyment":
                        ["totalRatings": 0,
                         "totalScore": 0
                        ],
                     "likelinessToReturn":
                        ["totalRatings": 0,
                         "totalScore": 0
                        ]
                    ]
                ],
                ["comments": "nil"
                ],
                ["tags": "nil"]
            ]
        ]
        ref.child("parks").updateChildValues(newPark as Any as! [AnyHashable : Any])
    }
    
    
}
