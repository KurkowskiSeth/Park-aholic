//
//  UserComments_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension UserReview_ViewController {
    func createCommentUI() {
        
        //Create animated first view
        userCommentContentView.tag = 2
        userCommentContentView.translatesAutoresizingMaskIntoConstraints = false
        userCommentContentView.backgroundColor = UIColor(displayP3Red: 0, green: 204, blue: 0, alpha: 0.45)
        userCommentContentView.layer.cornerRadius = 25
        
        view.addSubview(userCommentContentView)
        
        userCommentContentView.topAnchor.constraint(equalTo: pageHeader.bottomAnchor, constant: 10).isActive = true
        userCommentContentView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30).isActive = true
        userCommentContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        userCommentContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        //Create header for comments
        let commentHeader = UIView()
        commentHeader.translatesAutoresizingMaskIntoConstraints = false
        
        userCommentContentView.addSubview(commentHeader)
        
        commentHeader.topAnchor.constraint(equalTo: userCommentContentView.topAnchor, constant: 20).isActive = true
        commentHeader.leftAnchor.constraint(equalTo: userCommentContentView.leftAnchor, constant: 5).isActive = true
        commentHeader.rightAnchor.constraint(equalTo: userCommentContentView.rightAnchor, constant: -50).isActive = true
        commentHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05, constant: 1).isActive = true
        
        let commentHeaderLbl = UILabel()
        commentHeaderLbl.text = "Please Share Your Experiences"
        commentHeaderLbl.translatesAutoresizingMaskIntoConstraints = false
        
        commentHeader.addSubview(commentHeaderLbl)
        
        commentHeaderLbl.centerYAnchor.constraint(equalTo: commentHeader.centerYAnchor).isActive = true
        commentHeaderLbl.leftAnchor.constraint(equalTo: commentHeader.leftAnchor, constant: 5).isActive = true
        
        //Create text field for user to enter comment
        commentTF.delegate = self
        commentTF.translatesAutoresizingMaskIntoConstraints = false
        commentTF.backgroundColor = UIColor.white
        
        userCommentContentView.addSubview(commentTF)
        
        commentTF.topAnchor.constraint(equalTo: commentHeaderLbl.bottomAnchor, constant: 15).isActive = true
        commentTF.bottomAnchor.constraint(equalTo: userCommentContentView.bottomAnchor, constant: -15).isActive = true
        commentTF.leftAnchor.constraint(equalTo: userCommentContentView.leftAnchor, constant: 10).isActive = true
        commentTF.rightAnchor.constraint(equalTo: userCommentContentView.rightAnchor, constant: -10).isActive = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //Animate this view off and the next view on.
    func transitionCommentsToTags() {
        AnimatedViewClass.animate(withDuration: 0.5) {
            self.userTagsContentView.center.x -= self.view.bounds.width
        }
    }
    
}
