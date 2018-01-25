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
    @IBOutlet weak var favoritesBtn: UIButton!
    
    
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
        
        if checkIfStoredInCD(){
            favoritesBtn.adjustsImageWhenDisabled = false
            favoritesBtn.isEnabled = false
            favoritesBtn.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func saveToCoreData(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)!
        let favPark = NSManagedObject(entity: entity, insertInto: managedContext)
        favPark.setValue(parkData?.name, forKey: "name")
        favPark.setValue(parkData?.city, forKey: "city")
        favPark.setValue(parkData?.state, forKey: "state")
        favPark.setValue(parkData?.averageParkQualityRating, forKey: "pqAverage")
        favPark.setValue(parkData?.averageParkEquipmentRating, forKey: "peAverage")
        favPark.setValue(parkData?.averageNeighborhoodRating, forKey: "nAverage")
        favPark.setValue(parkData?.averageOverallEnjoymentRating, forKey: "oeAverage")
        favPark.setValue(parkData?.averageLikelinessToReturnRating, forKey: "lrAverage")
        do {
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
        favoritesBtn.adjustsImageWhenDisabled = false
        favoritesBtn.isEnabled = false
        favoritesBtn.setImage(#imageLiteral(resourceName: "parkaholic_Star_Filled"), for: .normal)
        
    }
    
    func checkIfStoredInCD() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {return false}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        do {
            let park = try managedContext.fetch(fetchRequest)
            for p in park {
                let name = p.value(forKey: "name") as? String
                if parkData?.name == name {
                    return true
                } else {
                    return false
                }
            }
        } catch {
            print(error.localizedDescription)
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
