//
//  UserRatings_EXT.swift
//  Park-aholic
//
//  Created by Seth Kurkowski on 1/22/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension UserReview_ViewController {
    
    //Create the ui for letting the user's rate the park's categories.
    func createUserRatingsUI() {
        //Create Content view
        userRatingsContentView.translatesAutoresizingMaskIntoConstraints = false
        userRatingsContentView.backgroundColor = UIColor.green
        
        view.addSubview(userRatingsContentView)
        
        userRatingsContentView.topAnchor.constraint(equalTo: pageHeader.bottomAnchor, constant: 5).isActive = true
        userRatingsContentView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30).isActive = true
        userRatingsContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        userRatingsContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        
        //Create header for ratings
        let ratingHeader = UIView()
        ratingHeader.translatesAutoresizingMaskIntoConstraints = false
        ratingHeader.backgroundColor = UIColor.green
        
        userRatingsContentView.addSubview(ratingHeader)
        
        ratingHeader.topAnchor.constraint(equalTo: userRatingsContentView.topAnchor, constant: 20).isActive = true
        ratingHeader.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 5).isActive = true
        ratingHeader.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -50).isActive = true
        ratingHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05, constant: 1).isActive = true
        
        let ratingHeaderLbl = UILabel()
        ratingHeaderLbl.text = "Rate Each Category"
        ratingHeaderLbl.translatesAutoresizingMaskIntoConstraints = false
        
        ratingHeader.addSubview(ratingHeaderLbl)
        
        ratingHeaderLbl.centerYAnchor.constraint(equalTo: ratingHeader.centerYAnchor).isActive = true
        ratingHeaderLbl.leftAnchor.constraint(equalTo: ratingHeader.leftAnchor, constant: 5).isActive = true
        
        //MARK: Park Quality
        let parkQualityRatingView = UIView()
        parkQualityRatingView.translatesAutoresizingMaskIntoConstraints = false
        parkQualityRatingView.backgroundColor = UIColor.red
        
        userRatingsContentView.addSubview(parkQualityRatingView)
        
        parkQualityRatingView.topAnchor.constraint(equalTo: ratingHeader.bottomAnchor, constant: 15).isActive = true
        parkQualityRatingView.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 10).isActive = true
        parkQualityRatingView.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -10).isActive = true
        parkQualityRatingView.heightAnchor.constraint(equalTo: ratingHeader.heightAnchor).isActive = true
        
        let parkQualityLbl = UILabel()
        parkQualityLbl.text = "Park Quality"
        parkQualityLbl.translatesAutoresizingMaskIntoConstraints = false
        
        parkQualityRatingView.addSubview(parkQualityLbl)
        
        parkQualityLbl.centerYAnchor.constraint(equalTo: parkQualityRatingView.centerYAnchor).isActive = true
        parkQualityLbl.leftAnchor.constraint(equalTo: parkQualityRatingView.leftAnchor, constant: 5).isActive = true
        
        createParkQualityButtons(pqView: parkQualityRatingView)
        
        //MARK: Park equipment
        let parkEquipmentRatingView = UIView()
        parkEquipmentRatingView.translatesAutoresizingMaskIntoConstraints = false
        parkEquipmentRatingView.backgroundColor = UIColor.red
        
        userRatingsContentView.addSubview(parkEquipmentRatingView)
        
        parkEquipmentRatingView.topAnchor.constraint(equalTo: parkQualityRatingView.bottomAnchor, constant: 15).isActive = true
        parkEquipmentRatingView.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 10).isActive = true
        parkEquipmentRatingView.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -10).isActive = true
        parkEquipmentRatingView.heightAnchor.constraint(equalTo: parkQualityRatingView.heightAnchor).isActive = true
        
        let parkEquipmentLbl = UILabel()
        parkEquipmentLbl.text = "Park Equipment"
        parkEquipmentLbl.translatesAutoresizingMaskIntoConstraints = false
        
        parkEquipmentRatingView.addSubview(parkEquipmentLbl)
        
        parkEquipmentLbl.centerYAnchor.constraint(equalTo: parkEquipmentRatingView.centerYAnchor).isActive = true
        parkEquipmentLbl.leftAnchor.constraint(equalTo: parkEquipmentRatingView.leftAnchor, constant: 5).isActive = true
        
        createParkEquipmentButtons(peView: parkEquipmentRatingView)
        
        //MARK: Neighborhood
        let neighborhoodRatingView = UIView()
        neighborhoodRatingView.translatesAutoresizingMaskIntoConstraints = false
        neighborhoodRatingView.backgroundColor = UIColor.red
        
        userRatingsContentView.addSubview(neighborhoodRatingView)
        
        neighborhoodRatingView.topAnchor.constraint(equalTo: parkEquipmentRatingView.bottomAnchor, constant: 15).isActive = true
        neighborhoodRatingView.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 10).isActive = true
        neighborhoodRatingView.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -10).isActive = true
        neighborhoodRatingView.heightAnchor.constraint(equalTo: parkEquipmentRatingView.heightAnchor).isActive = true
        
        let neighborhoodLbl = UILabel()
        neighborhoodLbl.text = "Neighborhood"
        neighborhoodLbl.translatesAutoresizingMaskIntoConstraints = false
        
        neighborhoodRatingView.addSubview(neighborhoodLbl)
        
        neighborhoodLbl.centerYAnchor.constraint(equalTo: neighborhoodRatingView.centerYAnchor).isActive = true
        neighborhoodLbl.leftAnchor.constraint(equalTo: neighborhoodRatingView.leftAnchor, constant: 5).isActive = true
        
        createNeighborhoodButtons(pnView: neighborhoodRatingView)
        
        //MARK: Overall Enjoyment
        let overallEnjoymentRatingView = UIView()
        overallEnjoymentRatingView.translatesAutoresizingMaskIntoConstraints = false
        overallEnjoymentRatingView.backgroundColor = UIColor.red
        
        userRatingsContentView.addSubview(overallEnjoymentRatingView)
        
        overallEnjoymentRatingView.topAnchor.constraint(equalTo: neighborhoodRatingView.bottomAnchor, constant: 15).isActive = true
        overallEnjoymentRatingView.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 10).isActive = true
        overallEnjoymentRatingView.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -10).isActive = true
        overallEnjoymentRatingView.heightAnchor.constraint(equalTo: neighborhoodRatingView.heightAnchor).isActive = true
        
        let overallEnjoymentLbl = UILabel()
        overallEnjoymentLbl.text = "Overall Enjoyment"
        overallEnjoymentLbl.translatesAutoresizingMaskIntoConstraints = false
        
        overallEnjoymentRatingView.addSubview(overallEnjoymentLbl)
        
        overallEnjoymentLbl.centerYAnchor.constraint(equalTo: overallEnjoymentRatingView.centerYAnchor).isActive = true
        overallEnjoymentLbl.leftAnchor.constraint(equalTo: overallEnjoymentRatingView.leftAnchor, constant: 5).isActive = true
        
        createEnjoymentButtons(poeView: overallEnjoymentRatingView)
        
        //MARK: Likeliness to Return
        let likelinessToReturnRatingView = UIView()
        likelinessToReturnRatingView.translatesAutoresizingMaskIntoConstraints = false
        likelinessToReturnRatingView.backgroundColor = UIColor.red
        
        userRatingsContentView.addSubview(likelinessToReturnRatingView)
        
        likelinessToReturnRatingView.topAnchor.constraint(equalTo: overallEnjoymentRatingView.bottomAnchor, constant: 15).isActive = true
        likelinessToReturnRatingView.leftAnchor.constraint(equalTo: userRatingsContentView.leftAnchor, constant: 10).isActive = true
        likelinessToReturnRatingView.rightAnchor.constraint(equalTo: userRatingsContentView.rightAnchor, constant: -10).isActive = true
        likelinessToReturnRatingView.heightAnchor.constraint(equalTo: overallEnjoymentRatingView.heightAnchor).isActive = true
        
        let likelinessToReturnLbl = UILabel()
        likelinessToReturnLbl.text = "Likeliness to Return"
        likelinessToReturnLbl.translatesAutoresizingMaskIntoConstraints = false
        
        likelinessToReturnRatingView.addSubview(likelinessToReturnLbl)
        
        likelinessToReturnLbl.centerYAnchor.constraint(equalTo: likelinessToReturnRatingView.centerYAnchor).isActive = true
        likelinessToReturnLbl.leftAnchor.constraint(equalTo: likelinessToReturnRatingView.leftAnchor, constant: 5).isActive = true
        
        createLikelinessToReturnButtons(plrView: likelinessToReturnRatingView)
        
    }
    
    /*
     Button Creation
     Button tags:
     10s - Park Quality
     20s - Park Equipment
     30s - Neighborhood
     40s - Overall Enjoyment
     50s - Likeliness to Return
     */
    
    //MARK: Park quality button creation
    func createParkQualityButtons(pqView: UIView) {
        
        //Button 5
        pQBtn5.tag = 15
        pQBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pQBtn5.imageView?.contentMode = .scaleAspectFit
//        pQBtn5.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pQBtn5.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQBtn5)
        
        pQBtn5.rightAnchor.constraint(equalTo: pqView.rightAnchor, constant: -5).isActive = true
        pQBtn5.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQBtn5.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQBtn5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pQBtn4.tag = 14
        pQBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pQBtn4.imageView?.contentMode = .scaleAspectFit
//        pQBtn4.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pQBtn4.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQBtn4)
        
        pQBtn4.rightAnchor.constraint(equalTo: pQBtn5.leftAnchor, constant: 10).isActive = true
        pQBtn4.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQBtn4.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQBtn4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pQBtn3.tag = 13
        pQBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pQBtn3.imageView?.contentMode = .scaleAspectFit
//        pQBtn3.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pQBtn3.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQBtn3)
        
        pQBtn3.rightAnchor.constraint(equalTo: pQBtn4.leftAnchor, constant: 10).isActive = true
        pQBtn3.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQBtn3.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQBtn3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pQBtn2.tag = 12
        pQBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pQBtn2.imageView?.contentMode = .scaleAspectFit
//        pQBtn2.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pQBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQBtn2)
        
        pQBtn2.rightAnchor.constraint(equalTo: pQBtn3.leftAnchor, constant: 10).isActive = true
        pQBtn2.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQBtn2.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQBtn2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pQBtn1.tag = 11
        pQBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pQBtn1.imageView?.contentMode = .scaleAspectFit
//        pQBtn1.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pQBtn1.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQBtn1)
        
        pQBtn1.rightAnchor.constraint(equalTo: pQBtn2.leftAnchor, constant: 10).isActive = true
        pQBtn1.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQBtn1.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQBtn1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Park equipment button creation
    func createParkEquipmentButtons(peView: UIView) {
        
        //Button 5
        pEBtn5.tag = 25
        pEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pEBtn5.imageView?.contentMode = .scaleAspectFit
//        pEBtn5.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pEBtn5.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEBtn5)
        
        pEBtn5.rightAnchor.constraint(equalTo: peView.rightAnchor, constant: -5).isActive = true
        pEBtn5.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEBtn5.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEBtn5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pEBtn4.tag = 24
        pEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pEBtn4.imageView?.contentMode = .scaleAspectFit
//        pEBtn4.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pEBtn4.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEBtn4)
        
        pEBtn4.rightAnchor.constraint(equalTo: pEBtn5.leftAnchor, constant: 10).isActive = true
        pEBtn4.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEBtn4.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEBtn4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pEBtn3.tag = 23
        pEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pEBtn3.imageView?.contentMode = .scaleAspectFit
//        pEBtn3.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pEBtn3.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEBtn3)
        
        pEBtn3.rightAnchor.constraint(equalTo: pEBtn4.leftAnchor, constant: 10).isActive = true
        pEBtn3.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEBtn3.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEBtn3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pEBtn2.tag = 22
        pEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pEBtn2.imageView?.contentMode = .scaleAspectFit
//        pEBtn2.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pEBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEBtn2)
        
        pEBtn2.rightAnchor.constraint(equalTo: pEBtn3.leftAnchor, constant: 10).isActive = true
        pEBtn2.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEBtn2.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEBtn2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pEBtn1.tag = 21
        pEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pEBtn1.imageView?.contentMode = .scaleAspectFit
//        pEBtn1.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pEBtn1.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEBtn1)
        
        pEBtn1.rightAnchor.constraint(equalTo: pEBtn2.leftAnchor, constant: 10).isActive = true
        pEBtn1.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEBtn1.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEBtn1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Neighborhood button creation
    func createNeighborhoodButtons(pnView: UIView) {
        
        //Button 5
        pNBtn5.tag = 35
        pNBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pNBtn5.imageView?.contentMode = .scaleAspectFit
//        pNBtn5.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pNBtn5.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNBtn5)
        
        pNBtn5.rightAnchor.constraint(equalTo: pnView.rightAnchor, constant: -5).isActive = true
        pNBtn5.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNBtn5.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNBtn5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pNBtn4.tag = 34
        pNBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pNBtn4.imageView?.contentMode = .scaleAspectFit
//        pNBtn4.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pNBtn4.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNBtn4)
        
        pNBtn4.rightAnchor.constraint(equalTo: pNBtn5.leftAnchor, constant: 10).isActive = true
        pNBtn4.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNBtn4.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNBtn4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pNBtn3.tag = 33
        pNBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pNBtn3.imageView?.contentMode = .scaleAspectFit
//        pNBtn3.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pNBtn3.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNBtn3)
        
        pNBtn3.rightAnchor.constraint(equalTo: pNBtn4.leftAnchor, constant: 10).isActive = true
        pNBtn3.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNBtn3.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNBtn3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pNBtn2.tag = 32
        pNBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pNBtn2.imageView?.contentMode = .scaleAspectFit
//        pNBtn2.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pNBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNBtn2)
        
        pNBtn2.rightAnchor.constraint(equalTo: pNBtn3.leftAnchor, constant: 10).isActive = true
        pNBtn2.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNBtn2.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNBtn2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pNBtn1.tag = 31
        pNBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pNBtn1.imageView?.contentMode = .scaleAspectFit
//        pNBtn1.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pNBtn1.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNBtn1)
        
        pNBtn1.rightAnchor.constraint(equalTo: pNBtn2.leftAnchor, constant: 10).isActive = true
        pNBtn1.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNBtn1.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNBtn1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Overall enjoyment button creation
    func createEnjoymentButtons(poeView: UIView) {
        
        //Button 5
        pOEBtn5.tag = 45
        pOEBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pOEBtn5.imageView?.contentMode = .scaleAspectFit
//        pOEBtn5.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pOEBtn5.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEBtn5)
        
        pOEBtn5.rightAnchor.constraint(equalTo: poeView.rightAnchor, constant: -5).isActive = true
        pOEBtn5.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEBtn5.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEBtn5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pOEBtn4.tag = 44
        pOEBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pOEBtn4.imageView?.contentMode = .scaleAspectFit
//        pOEBtn4.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pOEBtn4.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEBtn4)
        
        pOEBtn4.rightAnchor.constraint(equalTo: pOEBtn5.leftAnchor, constant: 10).isActive = true
        pOEBtn4.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEBtn4.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEBtn4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pOEBtn3.tag = 43
        pOEBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pOEBtn3.imageView?.contentMode = .scaleAspectFit
//        pOEBtn3.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pOEBtn3.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEBtn3)
        
        pOEBtn3.rightAnchor.constraint(equalTo: pOEBtn4.leftAnchor, constant: 10).isActive = true
        pOEBtn3.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEBtn3.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEBtn3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pOEBtn2.tag = 42
        pOEBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pOEBtn2.imageView?.contentMode = .scaleAspectFit
//        pOEBtn2.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pOEBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEBtn2)
        
        pOEBtn2.rightAnchor.constraint(equalTo: pOEBtn3.leftAnchor, constant: 10).isActive = true
        pOEBtn2.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEBtn2.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEBtn2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pOEBtn1.tag = 41
        pOEBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pOEBtn1.imageView?.contentMode = .scaleAspectFit
//        pOEBtn1.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pOEBtn1.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEBtn1)
        
        pOEBtn1.rightAnchor.constraint(equalTo: pOEBtn2.leftAnchor, constant: 10).isActive = true
        pOEBtn1.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEBtn1.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEBtn1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Likeliness to return button creation
    func createLikelinessToReturnButtons(plrView: UIView) {
        
        //Button 5
        pLRBtn5.tag = 55
        pLRBtn5.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pLRBtn5.imageView?.contentMode = .scaleAspectFit
//        pLRBtn5.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pLRBtn5.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRBtn5)
        
        pLRBtn5.rightAnchor.constraint(equalTo: plrView.rightAnchor, constant: -5).isActive = true
        pLRBtn5.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRBtn5.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRBtn5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pLRBtn4.tag = 54
        pLRBtn4.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pLRBtn4.imageView?.contentMode = .scaleAspectFit
//        pLRBtn4.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pLRBtn4.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRBtn4)
        
        pLRBtn4.rightAnchor.constraint(equalTo: pLRBtn5.leftAnchor, constant: 10).isActive = true
        pLRBtn4.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRBtn4.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRBtn4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pLRBtn3.tag = 53
        pLRBtn3.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pLRBtn3.imageView?.contentMode = .scaleAspectFit
//        pLRBtn3.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pLRBtn3.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRBtn3)
        
        pLRBtn3.rightAnchor.constraint(equalTo: pLRBtn4.leftAnchor, constant: 10).isActive = true
        pLRBtn3.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRBtn3.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRBtn3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pLRBtn2.tag = 52
        pLRBtn2.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pLRBtn2.imageView?.contentMode = .scaleAspectFit
//        pLRBtn2.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pLRBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRBtn2)
        
        pLRBtn2.rightAnchor.constraint(equalTo: pLRBtn3.leftAnchor, constant: 10).isActive = true
        pLRBtn2.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRBtn2.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRBtn2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pLRBtn1.tag = 51
        pLRBtn1.setImage(#imageLiteral(resourceName: "parkaholic_Star_Empty"), for: .normal)
        pLRBtn1.imageView?.contentMode = .scaleAspectFit
//        pLRBtn1.addTarget(self, action: #selector(rankBtnTouched(sender:)), for: .touchUpInside)
        pLRBtn1.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRBtn1)
        
        pLRBtn1.rightAnchor.constraint(equalTo: pLRBtn2.leftAnchor, constant: 10).isActive = true
        pLRBtn1.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRBtn1.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRBtn1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
}
