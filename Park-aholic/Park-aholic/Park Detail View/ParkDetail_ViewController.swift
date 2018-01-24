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
    @IBOutlet weak var composeBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    var parkData: ParkDataModel? = nil
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkNameLbl.text = parkData?.name
        
        switch isLoggedIn {
        case true:
            composeBtn.isEnabled = true
        default:
            composeBtn.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func dismissController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? UserReview_ViewController
        destination?.parkData = self.parkData
    }
}
