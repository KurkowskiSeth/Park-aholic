//
//  UserReview_ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class UserReview_ViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var pageHeader: UIView!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create ui for ratings
        createUserRatingsUI()
    }
    
    @IBAction func dissmissController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
