//
//  ParkTableView_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkDataCell", for: indexPath) as? ParkCellTableViewCell
        
        cell?.lblParkName.text = parkArray[indexPath.row].name
        cell?.lblCityState.text = parkArray[indexPath.row].cityState
        
        return cell!
    }
    
}
