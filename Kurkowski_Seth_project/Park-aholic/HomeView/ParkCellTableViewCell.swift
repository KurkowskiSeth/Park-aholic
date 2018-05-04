//
//  ParkCellTableViewCell.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/11/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class ParkCellTableViewCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblParkName: UILabel!
    @IBOutlet weak var lblCityState: UILabel!
    @IBOutlet var ratingStars: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
