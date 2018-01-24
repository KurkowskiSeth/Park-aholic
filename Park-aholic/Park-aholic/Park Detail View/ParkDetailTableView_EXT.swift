//
//  ParkDetailTableView_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/23/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ParkDetail_ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "averageRatingsCell", for: indexPath) as? averageRatings_TableViewCell
        cell?.isUserInteractionEnabled = false
        
        switch parkData?.averageParkQualityRating {
        case 1?:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2?:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3?:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4?:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5?:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pQStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pQStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch parkData?.averageParkEquipmentRating {
        case 1?:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2?:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3?:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4?:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5?:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch parkData?.averageNeighborhoodRating {
        case 1?:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2?:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3?:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4?:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5?:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pNStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pNStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch parkData?.averageOverallEnjoymentRating {
        case 1?:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2?:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3?:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4?:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5?:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pOEStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pOEStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        switch parkData?.averageLikelinessToReturnRating {
        case 1?:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 2?:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 3?:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 4?:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        case 5?:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Filled")
        default:
            cell?.pLRStar1.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar2.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar3.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar4.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
            cell?.pLRStar5.image = #imageLiteral(resourceName: "parkaholic_Star_Empty")
        }
        
        return cell!
    }
    
}
