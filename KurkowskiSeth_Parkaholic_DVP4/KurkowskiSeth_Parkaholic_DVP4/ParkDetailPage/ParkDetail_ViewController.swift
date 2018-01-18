//
//  ParkDetail_ViewController.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/16/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import Firebase

class ParkDetail_ViewController: UIViewController {
    
    var parkDetails: ParkDataModel? = nil
    var userLoggedIn: Bool? = nil
    let scrollView = UIScrollView()
    var ref: DatabaseReference!

    @IBOutlet weak var composeReviewBBI: UIBarButtonItem!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check to see if user is logged in and has the ability to compose a review
        switch userLoggedIn {
        case true?:
            composeReviewBBI.isEnabled = true
        case false?:
            composeReviewBBI.isEnabled = false
        default:
            composeReviewBBI.isEnabled = false
            print("Error with user log in var in ParkDetail_ViewController")
        }
        
        createScrollView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMainPage(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserReview_ViewController {
            destination.parkName = (parkDetails?.name)!
            destination.ref = ref
        }
    }

}
