//
//  HamburgerMenu_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/25/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ViewController {
    
    func createHambugerMenu() {
        //MARK: Content View
        hamburgerMenuContentView.backgroundColor = UIColor(displayP3Red: 0, green: 204, blue: 0, alpha: 1)
        hamburgerMenuContentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hamburgerMenuContentView)
        
        hamburgerMenuContentView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0).isActive = true
        hamburgerMenuContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        hamburgerMenuContentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        hamburgerMenuContentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
        //MARK: Favorites Button
        let favoritesBtn = UIButton(type: .system)
        favoritesBtn.setTitle("Favorites", for: .normal)
        favoritesBtn.tintColor = UIColor.darkText
        favoritesBtn.addTarget(self, action: #selector(popFavoritesView), for: .touchUpInside)
        favoritesBtn.translatesAutoresizingMaskIntoConstraints = false
        
        hamburgerMenuContentView.addSubview(favoritesBtn)
        
        favoritesBtn.topAnchor.constraint(equalTo: hamburgerMenuContentView.topAnchor, constant: 15).isActive = true
        favoritesBtn.leftAnchor.constraint(equalTo: hamburgerMenuContentView.leftAnchor, constant: 15).isActive = true
        favoritesBtn.rightAnchor.constraint(equalTo: hamburgerMenuContentView.rightAnchor, constant: -15).isActive = true
        favoritesBtn.heightAnchor.constraint(equalTo: hamburgerMenuContentView.heightAnchor, multiplier: 0.15).isActive = true
        
        //MARK: About Button
        let aboutBtn = UIButton(type: .system)
        aboutBtn.setTitle("About", for: .normal)
        aboutBtn.tintColor = UIColor.darkText
        aboutBtn.translatesAutoresizingMaskIntoConstraints = false
        
        hamburgerMenuContentView.addSubview(aboutBtn)
        
        aboutBtn.topAnchor.constraint(equalTo: favoritesBtn.bottomAnchor, constant: 15).isActive = true
        aboutBtn.heightAnchor.constraint(equalTo: favoritesBtn.heightAnchor).isActive = true
        aboutBtn.centerXAnchor.constraint(equalTo: favoritesBtn.centerXAnchor).isActive = true
        aboutBtn.widthAnchor.constraint(equalTo: favoritesBtn.widthAnchor).isActive = true
        
        //MARK: Sign in and out button
        if isLoggedIn {
            signOutInBtn.setTitle("Sign Out", for: .normal)
            signOutInBtn.tag = 1
        } else {
            signOutInBtn.setTitle("Sign In", for: .normal)
            signOutInBtn.tag = 0
        }
        signOutInBtn.tintColor = UIColor.darkText
        signOutInBtn.addTarget(self, action: #selector(signInOrSignOut), for: .touchUpInside)
        signOutInBtn.translatesAutoresizingMaskIntoConstraints = false
        
        hamburgerMenuContentView.addSubview(signOutInBtn)
        
        signOutInBtn.topAnchor.constraint(equalTo: aboutBtn.bottomAnchor, constant: 15).isActive = true
        signOutInBtn.heightAnchor.constraint(equalTo: aboutBtn.heightAnchor).isActive = true
        signOutInBtn.centerXAnchor.constraint(equalTo: aboutBtn.centerXAnchor).isActive = true
        signOutInBtn.widthAnchor.constraint(equalTo: aboutBtn.widthAnchor).isActive = true
    }
}
