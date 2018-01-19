//
//  ViewController.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/9/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, FUIAuthDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountBBI: UIBarButtonItem!
    @IBOutlet weak var filterBBI: UIBarButtonItem!
    
    // MARK: - Firebase Auth Properties
    fileprivate(set) var auth: Auth?
    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    //Firebase Database Properties
    var ref: DatabaseReference!
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //Properties
    var parkArray = [ParkDataModel]()
    var isLoggedIn: Bool!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates for mapKit/Core location
        coreLocationManager.delegate = self
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //Request location servies
        requestAuthorization()

        //Set up firebase authorization
        auth = Auth.auth()
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        authUI?.providers = [FUIGoogleAuth()]
        
        //Check to see if the user is already logged in
        authStateListenerHandle = auth?.addStateDidChangeListener({ (auth, user) in
            if user != nil {
                self.isLoggedIn = true
                self.accountBBI.title = "Account"
                self.accountBBI.tag = 1
            } else {
                self.isLoggedIn = false
                self.accountBBI.title = "Sign In"
                self.accountBBI.tag = 0
            }
        })
        
        //Set up database reference
        ref = Database.database().reference()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Deselect any table view cells that are selected
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: false)
        }
    }
    
    //MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ParkDetail_ViewController {
            destination.parkDetails = parkArray[(tableView.indexPathForSelectedRow?.row)!]
            destination.userLoggedIn = isLoggedIn
            destination.ref = ref
        }
    }
    
    @IBAction func signInBtn(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            //Present firebaseUI log in view controller
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true, completion: nil)
            if isLoggedIn == true {
                sender.tag = 1
                sender.title = "Account"
            }
        case 1:
            accountViewSetUp()
            
        case 2:
            //Remove account view from it's super view
            for subview in view.subviews {
                if subview.tag == 67 {
                    subview.removeFromSuperview()
                }
            }
            
            accountBBI.title = "Account"
            accountBBI.tag = 1
            filterBBI.isEnabled = true
            mapView.isUserInteractionEnabled = true
            tableView.isUserInteractionEnabled = true
            
        default:
            print("Error with signIn/Account bar button item")
        }
    }
    
    //MARK: Set up table view cells and rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell1", for: indexPath) as? ParkCellTableViewCell
        
        cell?.lblParkName.text = parkArray[indexPath.row].name
        cell?.lblCityState.text = parkArray[indexPath.row].cityState
        
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        performSegue(withIdentifier: "homeToParkDetails", sender: self)
//        self.navigationController?.popToViewController((ParkDetail_ViewController as? UIViewController)!, animated: true)
//    }
    
    
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

    
    //MARK: Account view sign out button action
    @objc func attemptSignOut(sender: UIButton!) {
        print("Touched")
        do {
            try auth?.signOut()
            let viewToRemove = view.viewWithTag(67)
            viewToRemove?.removeFromSuperview()
            filterBBI.isEnabled = true
            mapView.isUserInteractionEnabled = true
            tableView.isUserInteractionEnabled = true
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }


}

