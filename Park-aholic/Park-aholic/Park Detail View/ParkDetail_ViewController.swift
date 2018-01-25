//
//  ParkDetail_ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import CoreData

class ParkDetail_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //IBOutlets
    @IBOutlet weak var parkNameLbl: UILabel!
    @IBOutlet weak var composeBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    //Core Data Properties
    internal let appDelegate = UIApplication.shared.delegate as! AppDelegate
    internal var managedContext: NSManagedObjectContext!
    internal var entityDescription: NSEntityDescription!
    internal var favorites: NSManagedObject!
    
    //General Properties
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
        
        //Set up core data
        managedContext = appDelegate.managedObjectContext
        entityDescription = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)
        
        //Check to see if park is added to favorites
        if checkForParkInCD() {
            favoriteBtn.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
            favoriteBtn.isUserInteractionEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addParkToFavorites(_ sender: UIButton) {
        //Save this park's average ratings to core data
        favorites = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: managedContext)
        favorites.setValue(parkData?.name, forKey: "parkName")
        favorites.setValue(parkData?.averageParkQualityRating, forKey: "parkQualityAverage")
        favorites.setValue(parkData?.averageParkEquipmentRating, forKey: "parkEquipmentAverage")
        favorites.setValue(parkData?.averageNeighborhoodRating, forKey: "neighborhoodAverage")
        favorites.setValue(parkData?.averageOverallEnjoymentRating, forKey: "overallEnjoymentAverage")
        favorites.setValue(parkData?.averageLikelinessToReturnRating, forKey: "likelinessToReturnAverage")
        appDelegate.saveContext()
        
        sender.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
        sender.isEnabled = false
        
    }
    
    func checkForParkInCD() -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
                
                for obj in results {
                    favorites = obj
                    
                    if parkData?.name == obj.value(forKey: "parkName") as? String{
                        return true
                    }
                    
                }
        }
        catch {
            assertionFailure()
        }
        return false
    }
    
    @IBAction func dismissController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? UserReview_ViewController
        destination?.parkData = self.parkData
    }
}
