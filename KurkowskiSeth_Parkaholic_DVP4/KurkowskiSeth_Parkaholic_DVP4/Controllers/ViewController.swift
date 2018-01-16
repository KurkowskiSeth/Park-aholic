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
import FirebaseTwitterAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, FUIAuthDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
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
        authUI?.providers = [FUITwitterAuth(),]
        
        
    }
    
    @IBAction func signInBtn(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            //Present firebaseUI log in view controller
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true, completion: nil)
            //TODO - Chance bar button item to account page
            sender.tag = 1
        case 1:
            //TODO - Set up account page
            print("WAT?")
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


}

