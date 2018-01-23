//
//  UserReview_ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class UserReview_ViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var pageHeader: UIView!
    @IBOutlet weak var parkNameLbl: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
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
    
    //General Properties
    let userRatingsContentView = AnimatedViewClass()
    let userCommentContentView = AnimatedViewClass()
    let commentTF = UITextField()
    let userTagsContentView = AnimatedViewClass()
    var tagsCollectionView: UICollectionView!
    var parkData: ParkDataModel? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create ui for ratings
        parkNameLbl.text = parkData?.name
        createUserRatingsUI()
    }
    
    @IBAction func nextView(_ sender: UIButton) {
        //Check sender's tag to see which view to animate off and which to animate on
        if sender.tag == 1 {
            createCommentUI()
            userRatingsContentView.leaveScreen()
            transitionRatingsToComments()
            sender.tag = 2
        } else if sender.tag == 2 {
            userRatingsContentView.isHidden = true
            createTagsUI()
            userCommentContentView.leaveScreen()
            transitionCommentsToTags()
            sender.isEnabled = false
        }
    }
    
    @IBAction func dissmissController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Rank button function
    @objc func rankBtnTouched(sender: UIButton) {
        switch sender.tag {
        case 11:
            pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkQualityTotalScore = 1
        case 12:
            pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkQualityTotalScore = 2
        case 13:
            pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkQualityTotalScore = 3
        case 14:
            pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkQualityTotalScore = 4
        case 15:
            pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
//            parkQualityTotalScore = 5
        case 21:
            pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkEquipmentTotalScore = 1
        case 22:
            pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkEquipmentTotalScore = 2
        case 23:
            pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkEquipmentTotalScore = 3
        case 24:
            pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            parkEquipmentTotalScore = 4
        case 25:
            pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
//            parkEquipmentTotalScore = 5
        case 31:
            pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            neighborhoodTotalScore = 1
        case 32:
            pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            neighborhoodTotalScore = 1
        case 33:
            pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            neighborhoodTotalScore = 3
        case 34:
            pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            neighborhoodTotalScore = 4
        case 35:
            pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
//            neighborhoodTotalScore = 5
        case 41:
            pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            overallEnjoymentTotalScore = 1
        case 42:
            pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            overallEnjoymentTotalScore = 2
        case 43:
            pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            overallEnjoymentTotalScore = 3
        case 44:
            pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            overallEnjoymentTotalScore = 4
        case 45:
            pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
//            overallEnjoymentTotalScore = 5
        case 51:
            pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            likelinessToReturnTotalScore = 1
        case 52:
            pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            likelinessToReturnTotalScore = 2
        case 53:
            pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            likelinessToReturnTotalScore = 3
        case 54:
            pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
//            likelinessToReturnTotalScore = 4
        case 55:
            pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
//            likelinessToReturnTotalScore = 5
        default:
            print("Error in rankBtnTouch Tas switch")
        }
    }
    
}
