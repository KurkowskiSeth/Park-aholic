//
//  FavPark_TableViewCell.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/25/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class FavPark_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var parknameLbl: UILabel!
    @IBOutlet var pqStars: [UIImageView]!
    @IBOutlet var peStars: [UIImageView]!
    @IBOutlet var nStars: [UIImageView]!
    @IBOutlet var oeStars: [UIImageView]!
    @IBOutlet var lrStars: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
