//
//  apiPull_Ext.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/9/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import Foundation
import MapKit
import Firebase

private let clientID = "ANC3Q4GH3U3RU5F4HBA3MMONZBVEZDWBKTPN10ZD2141NMQZ"
private let clientSecret = "DHF5B1FLMPUGYU3PIOISW1TZTK0NNA3VIGTNX0JAXCU434J3"

extension ViewController {
    
    func findParks() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        if let validURL = URL(string: "https://api.foursquare.com/v2/venues/search/?ll=\(recentLocation.coordinate.latitude),\(recentLocation.coordinate.longitude)&categoryId=4bf58dd8d48988d163941735&client_id=\(clientID)&client_secret=\(clientSecret)&v=20180111") {
//            print(validURL)
            let task = session.dataTask(with: validURL, completionHandler: { (data, urlResponse, error) in
                if error != nil {return}
                
                guard let response = urlResponse as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = data
                    else {print("error"); return}
                
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as Any? {
                        guard let json = jsonObject as? [String: Any],
                            let response = json["response"] as? [String: Any],
                            let venues = response["venues"] as? [Any]
                            else{print("Error in apiPull_EXT first guard statement"); return}
                        for venue in venues {
                            guard let park = venue as? [String: Any],
                                let parkID = park["id"] as? String,
                                let parkName = park["name"] as? String,
                                let location = park["location"] as? [String: Any],
                                let lat = location["lat"] as? Double,
                                let lng = location["lng"] as? Double,
                                let city = location["city"] as? String,
                                let state = location["state"] as? String
                                else{print("No data found in object array."); return}
                            
                            //check to see if park is in database, add if is not.
                            self.ref.child("parks").observeSingleEvent(of: .value, with: { (snapshot) in
                                if snapshot.hasChild(parkID) == false {
                                    self.parkArray.append(ParkDataModel(parkID: parkID, name: parkName, city: city, state: state, latitude: lat, longitude: lng))
                                    if self.isLoggedIn == true {
                                        self.addNewParkToDatabase(parkID: parkID, parkName: parkName)
                                    }
                                    DispatchQueue.main.async {
                                        self.addParksToMap()
                                        self.tableView.reloadData()
                                    }
                                } else {
                                    
                                    self.ref.child("parks").child(parkID).observeSingleEvent(of: .value, with: { (snapshot) in
                                        guard let value = snapshot.value as? NSDictionary,
                                        let averages = value["averages"] as? NSDictionary,
                                        let parkQuality = averages["parkQuality"] as? NSDictionary,
                                        let parkQualityTotalRatings = parkQuality["totalRatings"] as? Int,
                                        let parkQualityTotalReviews = parkQuality["totalReviews"] as? Int,
                                        let parkEquipment = averages["parkEquipment"] as? NSDictionary,
                                        let parkEquipmentTotalRatings = parkEquipment["totalRatings"] as? Int,
                                        let parkEquipmentTotalReviews = parkEquipment["totalReviews"] as? Int,
                                        let neighborhood = averages["neighborhood"] as? NSDictionary,
                                        let neighborhoodTotalRatings = neighborhood["totalRatings"] as? Int,
                                        let neighborhoodTotalReviews = neighborhood["totalReviews"] as? Int,
                                        let overallEnjoyment = averages["overallEnjoyment"] as? NSDictionary,
                                        let overallEnjoymentTotalRatings = overallEnjoyment["totalRatings"] as? Int,
                                        let overallEnjoymentTotalReviews = overallEnjoyment["totalReviews"] as? Int,
                                        let likelinessToReturn = averages["likelinessToReturn"] as? NSDictionary,
                                        let likelinessToReturnTotalRatings = likelinessToReturn["totalRatings"] as? Int,
                                        let likelinessToReturnTotalReviews = likelinessToReturn["totalReviews"] as? Int,
                                        let comments = value["comments"] as? NSArray
                                            else {print("Error in findParks database pull guard statement"); return}
                                        
                                        var commentsArray = [[String: String]]()
                                        for comment in comments {
                                            let comm = comment as? [String: String]
                                            commentsArray.append(comm!)
                                        }
                                        
                                        //add to park data array
                                        self.parkArray.append(ParkDataModel(parkID: parkID, name: parkName, city: city, state: state, latitude: lat, longitude: lng, parkQualityTotalRatings: parkQualityTotalRatings, parkQualityTotalReviews: parkQualityTotalReviews, parkEquipmentTotalRatings: parkEquipmentTotalRatings, parkEquipmentTotalReviews: parkEquipmentTotalReviews, neighborhoodTotalRatings: neighborhoodTotalRatings, neighborhoodTotalReviews: neighborhoodTotalReviews, overallEnjoymentTotalRatings: overallEnjoymentTotalRatings, overallEnjoymentTotalReviews: overallEnjoymentTotalReviews, likelinessToReturnTotalRatings: likelinessToReturnTotalRatings, likelinessToReturnTotalReviews: likelinessToReturnTotalReviews, commentsDict: commentsArray))
                                        
                                        DispatchQueue.main.async {
                                            self.addParksToMap()
                                            self.tableView.reloadData()
                                        }
                                        
                                    }, withCancel: { (error) in
                                        print(error.localizedDescription)
                                    })
                                    DispatchQueue.main.async {
                                        self.addParksToMap()
                                        self.tableView.reloadData()
                                    }
                                }
                            }, withCancel: { (error) in
                                print(error.localizedDescription)
                            })
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
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
}
