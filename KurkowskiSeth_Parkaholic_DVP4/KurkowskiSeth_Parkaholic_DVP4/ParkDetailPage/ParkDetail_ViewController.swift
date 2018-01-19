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
    
    //Park data
    var averageParkQualityScore = 0
    var averageParkEquipmentScore = 0
    var averageNeighborhoodScore = 0
    var averageOverallEnjoymentScore = 0
    var averageLikelinessToReturnScore = 0
    
    //Park rating images
    let pQStar1 = UIImageView()
    let pQStar2 = UIImageView()
    let pQStar3 = UIImageView()
    let pQStar4 = UIImageView()
    let pQStar5 = UIImageView()
    let pEStar1 = UIImageView()
    let pEStar2 = UIImageView()
    let pEStar3 = UIImageView()
    let pEStar4 = UIImageView()
    let pEStar5 = UIImageView()
    let pNStar1 = UIImageView()
    let pNStar2 = UIImageView()
    let pNStar3 = UIImageView()
    let pNStar4 = UIImageView()
    let pNStar5 = UIImageView()
    let pOEStar1 = UIImageView()
    let pOEStar2 = UIImageView()
    let pOEStar3 = UIImageView()
    let pOEStar4 = UIImageView()
    let pOEStar5 = UIImageView()
    let pLRStar1 = UIImageView()
    let pLRStar2 = UIImageView()
    let pLRStar3 = UIImageView()
    let pLRStar4 = UIImageView()
    let pLRStar5 = UIImageView()
    
    var parkDetails: ParkDataModel? = nil
    var userLoggedIn: Bool? = nil
    var parkInDatabase = false
    var ref: DatabaseReference!

    @IBOutlet weak var composeReviewBBI: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var parkQualityView: UIView!
    @IBOutlet weak var parkEquipmentView: UIView!
    @IBOutlet weak var neighborhoodView: UIView!
    @IBOutlet weak var overallEnjoymentView: UIView!
    @IBOutlet weak var likelinessToReturnView: UIView!
    
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
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            //Check to see if park is in database
            self.checkForPark()
            //Update Average Ratings
            self.addAverageRatings()
        }
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
