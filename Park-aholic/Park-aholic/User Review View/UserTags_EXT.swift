//
//  UserTags_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/23/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension UserReview_ViewController {
    func createTagsUI() {
        
        //Create animated first view
        userTagsContentView.tag = 2
        userTagsContentView.translatesAutoresizingMaskIntoConstraints = false
        userTagsContentView.backgroundColor = UIColor.cyan
        
        view.addSubview(userTagsContentView)
        
        userTagsContentView.topAnchor.constraint(equalTo: pageHeader.bottomAnchor, constant: 5).isActive = true
        userTagsContentView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30).isActive = true
        userTagsContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        userTagsContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        //Create header for comments
        let tagsHeader = UIView()
        tagsHeader.translatesAutoresizingMaskIntoConstraints = false
        tagsHeader.backgroundColor = UIColor.green
        
        userTagsContentView.addSubview(tagsHeader)
        
        tagsHeader.topAnchor.constraint(equalTo: userTagsContentView.topAnchor, constant: 20).isActive = true
        tagsHeader.leftAnchor.constraint(equalTo: userTagsContentView.leftAnchor, constant: 5).isActive = true
        tagsHeader.rightAnchor.constraint(equalTo: userTagsContentView.rightAnchor, constant: -50).isActive = true
        tagsHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05, constant: 1).isActive = true
        
        let tagsHeaderLbl = UILabel()
        tagsHeaderLbl.text = "Please Selects any Features"
        tagsHeaderLbl.translatesAutoresizingMaskIntoConstraints = false
        
        tagsHeader.addSubview(tagsHeaderLbl)
        
        tagsHeaderLbl.centerYAnchor.constraint(equalTo: tagsHeader.centerYAnchor).isActive = true
        tagsHeaderLbl.leftAnchor.constraint(equalTo: tagsHeader.leftAnchor, constant: 5).isActive = true
        
        //Create collection view to hold each tag
        let tagsCollectionViewContentView = UIView()
        tagsCollectionViewContentView.translatesAutoresizingMaskIntoConstraints = false
        tagsCollectionViewContentView.backgroundColor = UIColor.black
        
        userTagsContentView.addSubview(tagsCollectionViewContentView)
        
        tagsCollectionViewContentView.topAnchor.constraint(equalTo: tagsHeader.bottomAnchor, constant: 15).isActive = true
        tagsCollectionViewContentView.bottomAnchor.constraint(equalTo: userTagsContentView.bottomAnchor, constant: -15).isActive = true
        tagsCollectionViewContentView.leftAnchor.constraint(equalTo: userTagsContentView.leftAnchor, constant: 10).isActive = true
        tagsCollectionViewContentView.rightAnchor.constraint(equalTo: userTagsContentView.rightAnchor, constant: -10).isActive = true
        
        let tagsCollectionViewLayout = UICollectionViewFlowLayout()
        tagsCollectionViewLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tagsCollectionViewLayout.itemSize = CGSize(width: 20, height: 40)
        
        tagsCollectionView = UICollectionView(frame: tagsCollectionViewContentView.frame, collectionViewLayout: tagsCollectionViewLayout)
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
        tagsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TagCell")
        tagsCollectionView.backgroundColor = UIColor.white
        
        tagsCollectionViewContentView.addSubview(tagsCollectionView)
        tagsCollectionView.reloadData()
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tagsCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
}
