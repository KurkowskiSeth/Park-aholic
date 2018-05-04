//
//  averageRatings_TableViewCell.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/23/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class averageRatings_TableViewCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var pQStar1: UIImageView!
    @IBOutlet weak var pQStar2: UIImageView!
    @IBOutlet weak var pQStar3: UIImageView!
    @IBOutlet weak var pQStar4: UIImageView!
    @IBOutlet weak var pQStar5: UIImageView!
    @IBOutlet weak var pEStar1: UIImageView!
    @IBOutlet weak var pEStar2: UIImageView!
    @IBOutlet weak var pEStar3: UIImageView!
    @IBOutlet weak var pEStar4: UIImageView!
    @IBOutlet weak var pEStar5: UIImageView!
    @IBOutlet weak var pNStar1: UIImageView!
    @IBOutlet weak var pNStar2: UIImageView!
    @IBOutlet weak var pNStar3: UIImageView!
    @IBOutlet weak var pNStar4: UIImageView!
    @IBOutlet weak var pNStar5: UIImageView!
    @IBOutlet weak var pOEStar1: UIImageView!
    @IBOutlet weak var pOEStar2: UIImageView!
    @IBOutlet weak var pOEStar3: UIImageView!
    @IBOutlet weak var pOEStar4: UIImageView!
    @IBOutlet weak var pOEStar5: UIImageView!
    @IBOutlet weak var pLRStar1: UIImageView!
    @IBOutlet weak var pLRStar2: UIImageView!
    @IBOutlet weak var pLRStar3: UIImageView!
    @IBOutlet weak var pLRStar4: UIImageView!
    @IBOutlet weak var pLRStar5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
