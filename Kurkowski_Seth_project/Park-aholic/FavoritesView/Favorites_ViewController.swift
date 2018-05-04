//
//  Favorites_ViewController.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/25/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit
import CoreData

class Favorites_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    var favParks = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pullCoreDataValues()
        
    }
    
    //Pull data from core data
    func pullCoreDataValues() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        do {
            favParks = try managedContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        tableView.reloadData()
    }
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
