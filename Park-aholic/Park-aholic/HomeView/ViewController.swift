//
//  ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, FUIAuthDelegate {
    
    //IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signInOrOutBtn: UIBarButtonItem!
    
    //Firebase Properties
    fileprivate(set) var auth: Auth?
    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    var isLoggedIn = false
    var ref: DatabaseReference!
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //General Properties
    var parkArray = [ParkDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up delegates
        coreLocationManager.delegate = self
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //Request user's location
        requestAuthorization()
        
        //Set up firebase authorization and database
        auth = Auth.auth()
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        authUI?.providers = [FUIGoogleAuth()]
        ref = Database.database().reference()
        
        //Check to see if the user is already logged in
        authStateListenerHandle = auth?.addStateDidChangeListener({ (auth, user) in
            if user != nil {
                self.isLoggedIn = true
                self.signInOrOutBtn.title = "Sign Out"
                self.signInOrOutBtn.tag = 1
            } else {
                self.isLoggedIn = false
                self.signInOrOutBtn.title = "Sign In"
                self.signInOrOutBtn.tag = 0
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Deselect any table view cells that are selected
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: false)
        }
    }
    
    @IBAction func signInOrOutBtnTouched(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            //Present firebaseUI log in view controller
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true, completion: nil)
            if isLoggedIn == true {
                sender.tag = 1
                sender.title = "Sign Out"
            }
        case 1:
            do {
                try auth?.signOut()
                sender.tag = 0
                sender.title = "Sign In"
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        default:
            print("Error in sign in or out switch")
        }
    }
    
    //MARK: Implement the required protocol method for FIRAuthDelegate
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        guard let authError = error else {return}
        
        let errorCode = UInt((authError as NSError).code)
        
        switch errorCode {
        case FUIAuthErrorCode.userCancelledSignIn.rawValue:
            print("User cancelled sign in")
            break
        default:
            let detailedError = (authError as NSError).userInfo[NSUnderlyingErrorKey] ?? authError
            print("Login error: \((detailedError as! NSError).localizedDescription)")
        }
    }
    
    //Send park data model forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ParkDetail_ViewController
        destination?.parkData = parkArray[(tableView.indexPathForSelectedRow?.row)!]
    }
    
}

