//
//  userComments_TableViewCell.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/24/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class userComments_TableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
