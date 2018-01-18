//
//  UserReview_ViewController.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/17/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import Firebase

class UserReview_ViewController: UIViewController {
    
    //Database Properties
    var ref: DatabaseReference!
    var parkQualityScore = 0
    var parkEquipmentScore = 0
    var neighborhoodScore = 0
    var overallEjoymentScore = 0
    var likelinessToReturnScore = 0
    
    //Other Properties
    var parkName = "Park Name Error"
    
    //Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var parkNameLbl: UILabel!
    
    //Rank Buttons
    let pQBtn1 = UIButton()
    let pQBtn2 = UIButton()
    let pQBtn3 = UIButton()
    let pQBtn4 = UIButton()
    let pQBtn5 = UIButton()
    let pEBtn1 = UIButton()
    let pEBtn2 = UIButton()
    let pEBtn3 = UIButton()
    let pEBtn4 = UIButton()
    let pEBtn5 = UIButton()
    let pNBtn1 = UIButton()
    let pNBtn2 = UIButton()
    let pNBtn3 = UIButton()
    let pNBtn4 = UIButton()
    let pNBtn5 = UIButton()
    let pOEBtn1 = UIButton()
    let pOEBtn2 = UIButton()
    let pOEBtn3 = UIButton()
    let pOEBtn4 = UIButton()
    let pOEBtn5 = UIButton()
    let pLRBtn1 = UIButton()
    let pLRBtn2 = UIButton()
    let pLRBtn3 = UIButton()
    let pLRBtn4 = UIButton()
    let pLRBtn5 = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        parkNameLbl.text = parkName
        
        //Load first view
        DispatchQueue.main.async {
            self.createUI()
        }
    }
    
    //MARK: Rank button function
    @objc func rankBtnTouched(sender: UIButton) {
        switch sender.tag {
        case 11:
            pQBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkQualityScore = 1
        case 12:
            pQBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkQualityScore = 2
        case 13:
            pQBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkQualityScore = 3
        case 14:
            pQBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkQualityScore = 4
        case 15:
            pQBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            parkQualityScore = 5
        case 21:
            pEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkEquipmentScore = 1
        case 22:
            pEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkEquipmentScore = 2
        case 23:
            pEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkEquipmentScore = 3
        case 24:
            pEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            parkEquipmentScore = 4
        case 25:
            pEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            parkEquipmentScore = 5
        case 31:
            pNBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            neighborhoodScore = 1
        case 32:
            pNBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            neighborhoodScore = 1
        case 33:
            pNBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            neighborhoodScore = 3
        case 34:
            pNBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            neighborhoodScore = 4
        case 35:
            pNBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            neighborhoodScore = 5
        case 41:
            pOEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            overallEjoymentScore = 1
        case 42:
            pOEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            overallEjoymentScore = 2
        case 43:
            pOEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            overallEjoymentScore = 3
        case 44:
            pOEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            overallEjoymentScore = 4
        case 45:
            pOEBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            overallEjoymentScore = 5
        case 51:
            pLRBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            likelinessToReturnScore = 1
        case 52:
            pLRBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            likelinessToReturnScore = 2
        case 53:
            pLRBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            likelinessToReturnScore = 3
        case 54:
            pLRBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "star_Empty"), for: .normal)
            likelinessToReturnScore = 4
        case 55:
            pLRBtn1.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "star_Filled"), for: .normal)
            likelinessToReturnScore = 5
        default:
            print("Error in rankBtnTouch Tas switch")
        }
    }
    
    @IBAction func backToParkView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
