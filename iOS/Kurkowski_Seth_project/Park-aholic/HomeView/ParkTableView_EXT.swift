//
//  ParkTableView_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkDataCell", for: indexPath) as? ParkCellTableViewCell
        
        cell?.lblParkName.text = parkArray[indexPath.row].name
        cell?.lblCityState.text = parkArray[indexPath.row].cityState
        
        switch parkArray[indexPath.row].overallAverageRating {
        case 1:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.ratingStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.ratingStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        
        return cell!
    }
    
}
