//
//  AccountView_EXT.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/16/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ViewController {
    
    //Create view to disply information about the user's account and allow them to sign out
    func accountViewSetUp() {
        DispatchQueue.main.async {
            //Initial view set up
            let profileView = UIView()
            profileView.backgroundColor = UIColor.lightGray
            profileView.tag = 67
            profileView.isUserInteractionEnabled = true
            self.view.addSubview(profileView)
            
            profileView.translatesAutoresizingMaskIntoConstraints = false
            
            profileView.topAnchor.constraint(equalTo: self.mapView.topAnchor, constant: -5).isActive = true
            profileView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            profileView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.35, constant: 1).isActive = true
            profileView.leftAnchor.constraint(lessThanOrEqualTo: self.view.leftAnchor, constant: 0).isActive = true
            
            //Email title lable
            let emailTitleLabel = UILabel()
            emailTitleLabel.attributedText = NSAttributedString(string: "Email", attributes:
                [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
            profileView.addSubview(emailTitleLabel)
            
            emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            emailTitleLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
            emailTitleLabel.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 10).isActive = true
            
            //Sign Out button set up
            let signOutButton = UIButton(type: UIButtonType.system)
            signOutButton.setTitle("Sign Out", for: .normal)
            signOutButton.setTitleColor(UIColor.black, for: .normal)
            signOutButton.tintColor = UIColor.white
            signOutButton.addTarget(self, action: #selector(self.attemptSignOut(sender:)), for: .touchUpInside)
            profileView.addSubview(signOutButton)
            
            signOutButton.translatesAutoresizingMaskIntoConstraints = false
            
            signOutButton.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 10).isActive = true
            signOutButton.leftAnchor.constraint(equalTo: profileView.leftAnchor, constant: 15).isActive = true
            
            
            self.accountBBI.title = "Done"
            self.accountBBI.tag = 2
            self.filterBBI.isEnabled = false
            self.mapView.isUserInteractionEnabled = false
            self.tableView.isUserInteractionEnabled = false
            
        }
    }
    
}
