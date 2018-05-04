//
//  FavTableView_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/25/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import CoreData

extension Favorites_ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favParks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favParkCell", for: indexPath) as? FavPark_TableViewCell
        
        //Get core data elements
        let park = favParks[indexPath.row]
            guard let name = park.value(forKey: "name") as? String,
                let pqAvg = park.value(forKey: "pqAverage") as? Int,
                let peAvg = park.value(forKey: "peAverage") as? Int,
                let nAvg = park.value(forKey: "nAverage") as? Int,
                let oeAvg = park.value(forKey: "oeAverage") as? Int,
                let lrAvg = park.value(forKey: "lrAverage") as? Int
                else{print("error loading data from core data"); return cell!}
            
            //Configure Cell
        cell?.parknameLbl.text = name
        switch pqAvg {
        case 1:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pqStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pqStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch peAvg {
        case 1:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.peStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.peStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch nAvg {
        case 1:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch oeAvg {
        case 1:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.oeStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.oeStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch nAvg {
        case 1:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.nStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.nStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch lrAvg {
        case 1:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.lrStars[0].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[1].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[2].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[3].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.lrStars[4].image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        return cell!
    }
}
