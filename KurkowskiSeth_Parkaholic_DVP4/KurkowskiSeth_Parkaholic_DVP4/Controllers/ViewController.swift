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
    
    //Core Location Properties
    let coreLocationManager = CLLocationManager()
    var recentLocation: CLLocation!
    
    //Park Properties
    var parkArray = [ParkDataModel]()
    

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
                self.accountBBI.title = "Account"
                self.accountBBI.tag = 1
            } else {
                self.accountBBI.title = "Sign In"
                self.accountBBI.tag = 0
            }
        })
        
        
    }
    
    @IBAction func signInBtn(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            //Present firebaseUI log in view controller
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true, completion: nil)
            //TODO - Chance bar button item to account page
            sender.tag = 1
            sender.title = "Account"
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
    
    //Set up table view cells and rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell1", for: indexPath) as? ParkCellTableViewCell
        
        cell?.lblParkName.text = parkArray[indexPath.row].name
        cell?.lblCityState.text = parkArray[indexPath.row].cityState
        
        return cell!
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

