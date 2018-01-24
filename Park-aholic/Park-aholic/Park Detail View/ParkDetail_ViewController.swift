//
//  ParkDetail_ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class ParkDetail_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //IBOutlets
    @IBOutlet weak var parkNameLbl: UILabel!
    
    //Properties
    var parkData: ParkDataModel? = nil
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkNameLbl.text = parkData?.name
    }
    
    @IBAction func dismissController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? UserReview_ViewController
        destination?.parkData = self.parkData
    }
}
