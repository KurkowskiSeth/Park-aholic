//
//  ParkDetailPage_EXT.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/16/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ParkDetail_ViewController {
    
    
    func createUI() {
        //Create Scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.black
        
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        //Create page header
        let topHeaderView = UIView()
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        topHeaderView.backgroundColor = UIColor.cyan
        
        scrollView.addSubview(topHeaderView)
        
        //Add constraints to header view
        topHeaderView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25).isActive = true
        topHeaderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
        topHeaderView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -5).isActive = true
        topHeaderView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1, constant: 1).isActive = true
        
        //Create label with name of park
        let headerLbl = UILabel()
        headerLbl.text = parkDetails?.name
        headerLbl.font = UIFont(name: headerLbl.font.fontName, size: 22)
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        
        topHeaderView.addSubview(headerLbl)
        
        //Add constraints to header label
        headerLbl.centerXAnchor.constraint(equalTo: topHeaderView.centerXAnchor).isActive = true
        headerLbl.centerYAnchor.constraint(equalTo: topHeaderView.centerYAnchor).isActive = true
        
        //TODO - Add favorite icon
        
        
        //Create average rating header
        let averageHeaderView = UIView()
        averageHeaderView.translatesAutoresizingMaskIntoConstraints = false
        averageHeaderView.backgroundColor = UIColor.green
        
        scrollView.addSubview(averageHeaderView)
        
        averageHeaderView.topAnchor.constraint(equalTo: topHeaderView.bottomAnchor, constant: 25).isActive = true
        averageHeaderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
        averageHeaderView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -55).isActive = true
        averageHeaderView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05, constant: 1).isActive = true
        
        let averageHeaderLbl = UILabel()
        averageHeaderLbl.text = "Average User Ratings"
        averageHeaderLbl.translatesAutoresizingMaskIntoConstraints = false
        
        averageHeaderView.addSubview(averageHeaderLbl)
        
        averageHeaderLbl.centerYAnchor.constraint(equalTo: averageHeaderView.centerYAnchor).isActive = true
        averageHeaderLbl.leftAnchor.constraint(equalTo: averageHeaderView.leftAnchor, constant: 5).isActive = true
        
        //Create views for each average rating
        //Park Quality
        let parkQualityAvgView = UIView()
        parkQualityAvgView.translatesAutoresizingMaskIntoConstraints = false
        parkQualityAvgView.backgroundColor = UIColor.red
        
        scrollView.addSubview(parkQualityAvgView)
        
        parkQualityAvgView.topAnchor.constraint(equalTo: averageHeaderView.bottomAnchor, constant: 15).isActive = true
        parkQualityAvgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        parkQualityAvgView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        parkQualityAvgView.heightAnchor.constraint(equalTo: averageHeaderView.heightAnchor).isActive = true
        
        let parkQualityAvgLbl = UILabel()
        parkQualityAvgLbl.text = "Park Quality"
        parkQualityAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        
        parkQualityAvgView.addSubview(parkQualityAvgLbl)
        
        parkQualityAvgLbl.centerYAnchor.constraint(equalTo: parkQualityAvgView.centerYAnchor).isActive = true
        parkQualityAvgLbl.leftAnchor.constraint(equalTo: parkQualityAvgView.leftAnchor, constant: 5).isActive = true
        
        createParkQualityStars(pqView: parkQualityAvgView)
        
        //Park equipment
        let parkEquipmentAvgView = UIView()
        parkEquipmentAvgView.translatesAutoresizingMaskIntoConstraints = false
        parkEquipmentAvgView.backgroundColor = UIColor.red
        
        scrollView.addSubview(parkEquipmentAvgView)
        
        parkEquipmentAvgView.topAnchor.constraint(equalTo: parkQualityAvgView.bottomAnchor, constant: 15).isActive = true
        parkEquipmentAvgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        parkEquipmentAvgView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        parkEquipmentAvgView.heightAnchor.constraint(equalTo: parkQualityAvgView.heightAnchor).isActive = true
        
        let parkEquipmentAvgLbl = UILabel()
        parkEquipmentAvgLbl.text = "Park Equipment"
        parkEquipmentAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        
        parkEquipmentAvgView.addSubview(parkEquipmentAvgLbl)
        
        parkEquipmentAvgLbl.centerYAnchor.constraint(equalTo: parkEquipmentAvgView.centerYAnchor).isActive = true
        parkEquipmentAvgLbl.leftAnchor.constraint(equalTo: parkEquipmentAvgView.leftAnchor, constant: 5).isActive = true
        
        createParkEquipmentStars(peView: parkEquipmentAvgView)
        
        //Neighborhood
        let neighborhoodAvgView = UIView()
        neighborhoodAvgView.translatesAutoresizingMaskIntoConstraints = false
        neighborhoodAvgView.backgroundColor = UIColor.red
        
        scrollView.addSubview(neighborhoodAvgView)
        
        neighborhoodAvgView.topAnchor.constraint(equalTo: parkEquipmentAvgView.bottomAnchor, constant: 15).isActive = true
        neighborhoodAvgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        neighborhoodAvgView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        neighborhoodAvgView.heightAnchor.constraint(equalTo: parkEquipmentAvgView.heightAnchor).isActive = true
        
        let neighborhoodAvgLbl = UILabel()
        neighborhoodAvgLbl.text = "Neighborhood"
        neighborhoodAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        
        neighborhoodAvgView.addSubview(neighborhoodAvgLbl)
        
        neighborhoodAvgLbl.centerYAnchor.constraint(equalTo: neighborhoodAvgView.centerYAnchor).isActive = true
        neighborhoodAvgLbl.leftAnchor.constraint(equalTo: neighborhoodAvgView.leftAnchor, constant: 5).isActive = true
        
        createNeighborhoodStars(pnView: neighborhoodAvgView)
        
        //Overall Enjoyment
        let overallEnjoymentAvgView = UIView()
        overallEnjoymentAvgView.translatesAutoresizingMaskIntoConstraints = false
        overallEnjoymentAvgView.backgroundColor = UIColor.red
        
        scrollView.addSubview(overallEnjoymentAvgView)
        
        overallEnjoymentAvgView.topAnchor.constraint(equalTo: neighborhoodAvgView.bottomAnchor, constant: 15).isActive = true
        overallEnjoymentAvgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        overallEnjoymentAvgView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        overallEnjoymentAvgView.heightAnchor.constraint(equalTo: neighborhoodAvgView.heightAnchor).isActive = true
        
        let overallEnjoymentAvgLbl = UILabel()
        overallEnjoymentAvgLbl.text = "Overall Enjoyment"
        overallEnjoymentAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        
        overallEnjoymentAvgView.addSubview(overallEnjoymentAvgLbl)
        
        overallEnjoymentAvgLbl.centerYAnchor.constraint(equalTo: overallEnjoymentAvgView.centerYAnchor).isActive = true
        overallEnjoymentAvgLbl.leftAnchor.constraint(equalTo: overallEnjoymentAvgView.leftAnchor, constant: 5).isActive = true
        
        createOverallEnjoymentStars(poeView: overallEnjoymentAvgView)
        
        //Likeliness to Return
        let likelinessToReturnAvgView = UIView()
        likelinessToReturnAvgView.translatesAutoresizingMaskIntoConstraints = false
        likelinessToReturnAvgView.backgroundColor = UIColor.red
        
        scrollView.addSubview(likelinessToReturnAvgView)
        
        likelinessToReturnAvgView.topAnchor.constraint(equalTo: overallEnjoymentAvgView.bottomAnchor, constant: 15).isActive = true
        likelinessToReturnAvgView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        likelinessToReturnAvgView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        likelinessToReturnAvgView.heightAnchor.constraint(equalTo: overallEnjoymentAvgView.heightAnchor).isActive = true
        
        let likelinessToReturnAvgLbl = UILabel()
        likelinessToReturnAvgLbl.text = "Likeliness to Return"
        likelinessToReturnAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        
        likelinessToReturnAvgView.addSubview(likelinessToReturnAvgLbl)
        
        likelinessToReturnAvgLbl.centerYAnchor.constraint(equalTo: likelinessToReturnAvgView.centerYAnchor).isActive = true
        likelinessToReturnAvgLbl.leftAnchor.constraint(equalTo: likelinessToReturnAvgView.leftAnchor, constant: 5).isActive = true
        
        createLikelinessToReturnStars(plrView: likelinessToReturnAvgView)
        
        //Create tags header
        let tagsHeaderView = UIView()
        tagsHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tagsHeaderView.backgroundColor = UIColor.green
        
        scrollView.addSubview(tagsHeaderView)
        
        tagsHeaderView.topAnchor.constraint(equalTo: likelinessToReturnAvgView.bottomAnchor, constant: 25).isActive = true
        tagsHeaderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
        tagsHeaderView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -55).isActive = true
        tagsHeaderView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05, constant: 1).isActive = true
        
        let tagsHeaderLbl = UILabel()
        tagsHeaderLbl.text = "Tags"
        tagsHeaderLbl.translatesAutoresizingMaskIntoConstraints = false
        
        tagsHeaderView.addSubview(tagsHeaderLbl)
        
        tagsHeaderLbl.centerYAnchor.constraint(equalTo: tagsHeaderView.centerYAnchor).isActive = true
        tagsHeaderLbl.leftAnchor.constraint(equalTo: tagsHeaderView.leftAnchor, constant: 5).isActive = true
        
        //TODO: - Create Tags container based on what tags are saved in the database
        
        //Bottom View
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = true
        
        scrollView.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: tagsHeaderView.bottomAnchor, constant: -5).isActive = true
        bottomView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
        bottomView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -5).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -5).isActive = true
        
    }
    
    //MARK: Park Quality Stars
    func createParkQualityStars(pqView: UIView) {
        
        //Button 5
        pQStar5.tag = 15
        pQStar5.image = #imageLiteral(resourceName: "star_Empty")
        pQStar5.contentMode = .scaleAspectFit
        pQStar5.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQStar5)
        
        pQStar5.rightAnchor.constraint(equalTo: pqView.rightAnchor, constant: -5).isActive = true
        pQStar5.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQStar5.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQStar5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pQStar4.tag = 14
        pQStar4.image = #imageLiteral(resourceName: "star_Empty")
        pQStar4.contentMode = .scaleAspectFit
        pQStar4.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQStar4)
        
        pQStar4.rightAnchor.constraint(equalTo: pQStar5.leftAnchor, constant: 10).isActive = true
        pQStar4.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQStar4.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQStar4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pQStar3.tag = 13
        pQStar3.image = #imageLiteral(resourceName: "star_Empty")
        pQStar3.contentMode = .scaleAspectFit
        pQStar3.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQStar3)
        
        pQStar3.rightAnchor.constraint(equalTo: pQStar4.leftAnchor, constant: 10).isActive = true
        pQStar3.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQStar3.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQStar3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pQStar2.tag = 12
        pQStar2.image = #imageLiteral(resourceName: "star_Empty")
        pQStar2.contentMode = .scaleAspectFit
        pQStar2.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQStar2)
        
        pQStar2.rightAnchor.constraint(equalTo: pQStar3.leftAnchor, constant: 10).isActive = true
        pQStar2.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQStar2.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQStar2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pQStar1.tag = 11
        pQStar1.image = #imageLiteral(resourceName: "star_Empty")
        pQStar1.contentMode = .scaleAspectFit
        pQStar1.translatesAutoresizingMaskIntoConstraints = false
        
        pqView.addSubview(pQStar1)
        
        pQStar1.rightAnchor.constraint(equalTo: pQStar2.leftAnchor, constant: 10).isActive = true
        pQStar1.topAnchor.constraint(equalTo: pqView.topAnchor, constant: 5).isActive = true
        pQStar1.bottomAnchor.constraint(equalTo: pqView.bottomAnchor, constant: -5).isActive = true
        pQStar1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Park Equipment Stars
    func createParkEquipmentStars(peView: UIView) {
        
        //Button 5
        pEStar5.tag = 25
        pEStar5.image = #imageLiteral(resourceName: "star_Empty")
        pEStar5.contentMode = .scaleAspectFit
        pEStar5.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEStar5)
        
        pEStar5.rightAnchor.constraint(equalTo: peView.rightAnchor, constant: -5).isActive = true
        pEStar5.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEStar5.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEStar5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pEStar4.tag = 24
        pEStar4.image = #imageLiteral(resourceName: "star_Empty")
        pEStar4.contentMode = .scaleAspectFit
        pEStar4.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEStar4)
        
        pEStar4.rightAnchor.constraint(equalTo: pEStar5.leftAnchor, constant: 10).isActive = true
        pEStar4.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEStar4.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEStar4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pEStar3.tag = 23
        pEStar3.image = #imageLiteral(resourceName: "star_Empty")
        pEStar3.contentMode = .scaleAspectFit
        pEStar3.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEStar3)
        
        pEStar3.rightAnchor.constraint(equalTo: pEStar4.leftAnchor, constant: 10).isActive = true
        pEStar3.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEStar3.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEStar3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pEStar2.tag = 22
        pEStar2.image = #imageLiteral(resourceName: "star_Empty")
        pEStar2.contentMode = .scaleAspectFit
        pEStar2.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEStar2)
        
        pEStar2.rightAnchor.constraint(equalTo: pEStar3.leftAnchor, constant: 10).isActive = true
        pEStar2.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEStar2.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEStar2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pEStar1.tag = 21
        pEStar1.image = #imageLiteral(resourceName: "star_Empty")
        pEStar1.contentMode = .scaleAspectFit
        pEStar1.translatesAutoresizingMaskIntoConstraints = false
        
        peView.addSubview(pEStar1)
        
        pEStar1.rightAnchor.constraint(equalTo: pEStar2.leftAnchor, constant: 10).isActive = true
        pEStar1.topAnchor.constraint(equalTo: peView.topAnchor, constant: 5).isActive = true
        pEStar1.bottomAnchor.constraint(equalTo: peView.bottomAnchor, constant: -5).isActive = true
        pEStar1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Neighborhood Stars
    func createNeighborhoodStars(pnView: UIView) {
        
        //Button 5
        pNStar5.tag = 35
        pNStar5.image = #imageLiteral(resourceName: "star_Empty")
        pNStar5.contentMode = .scaleAspectFit
        pNStar5.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNStar5)
        
        pNStar5.rightAnchor.constraint(equalTo: pnView.rightAnchor, constant: -5).isActive = true
        pNStar5.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNStar5.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNStar5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pNStar4.tag = 34
        pNStar4.image = #imageLiteral(resourceName: "star_Empty")
        pNStar4.contentMode = .scaleAspectFit
        pNStar4.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNStar4)
        
        pNStar4.rightAnchor.constraint(equalTo: pNStar5.leftAnchor, constant: 10).isActive = true
        pNStar4.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNStar4.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNStar4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pNStar3.tag = 33
        pNStar3.image = #imageLiteral(resourceName: "star_Empty")
        pNStar3.contentMode = .scaleAspectFit
        pNStar3.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNStar3)
        
        pNStar3.rightAnchor.constraint(equalTo: pNStar4.leftAnchor, constant: 10).isActive = true
        pNStar3.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNStar3.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNStar3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pNStar2.tag = 32
        pNStar2.image = #imageLiteral(resourceName: "star_Empty")
        pNStar2.contentMode = .scaleAspectFit
        pNStar2.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNStar2)
        
        pNStar2.rightAnchor.constraint(equalTo: pNStar3.leftAnchor, constant: 10).isActive = true
        pNStar2.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNStar2.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNStar2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pNStar1.tag = 31
        pNStar1.image = #imageLiteral(resourceName: "star_Empty")
        pNStar1.contentMode = .scaleAspectFit
        pNStar1.translatesAutoresizingMaskIntoConstraints = false
        
        pnView.addSubview(pNStar1)
        
        pNStar1.rightAnchor.constraint(equalTo: pNStar2.leftAnchor, constant: 10).isActive = true
        pNStar1.topAnchor.constraint(equalTo: pnView.topAnchor, constant: 5).isActive = true
        pNStar1.bottomAnchor.constraint(equalTo: pnView.bottomAnchor, constant: -5).isActive = true
        pNStar1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Overal Enjoyment Stars
    func createOverallEnjoymentStars(poeView: UIView) {
        
        //Button 5
        pOEStar5.tag = 45
        pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
        pOEStar5.contentMode = .scaleAspectFit
        pOEStar5.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEStar5)
        
        pOEStar5.rightAnchor.constraint(equalTo: poeView.rightAnchor, constant: -5).isActive = true
        pOEStar5.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEStar5.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEStar5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pOEStar4.tag = 44
        pOEStar4.image = #imageLiteral(resourceName: "star_Empty")
        pOEStar4.contentMode = .scaleAspectFit
        pOEStar4.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEStar4)
        
        pOEStar4.rightAnchor.constraint(equalTo: pOEStar5.leftAnchor, constant: 10).isActive = true
        pOEStar4.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEStar4.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEStar4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pOEStar3.tag = 43
        pOEStar3.image = #imageLiteral(resourceName: "star_Empty")
        pOEStar3.contentMode = .scaleAspectFit
        pOEStar3.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEStar3)
        
        pOEStar3.rightAnchor.constraint(equalTo: pOEStar4.leftAnchor, constant: 10).isActive = true
        pOEStar3.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEStar3.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEStar3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pOEStar2.tag = 42
        pOEStar2.image = #imageLiteral(resourceName: "star_Empty")
        pOEStar2.contentMode = .scaleAspectFit
        pOEStar2.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEStar2)
        
        pOEStar2.rightAnchor.constraint(equalTo: pOEStar3.leftAnchor, constant: 10).isActive = true
        pOEStar2.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEStar2.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEStar2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pOEStar1.tag = 41
        pOEStar1.image = #imageLiteral(resourceName: "star_Empty")
        pOEStar1.contentMode = .scaleAspectFit
        pOEStar1.translatesAutoresizingMaskIntoConstraints = false
        
        poeView.addSubview(pOEStar1)
        
        pOEStar1.rightAnchor.constraint(equalTo: pOEStar2.leftAnchor, constant: 10).isActive = true
        pOEStar1.topAnchor.constraint(equalTo: poeView.topAnchor, constant: 5).isActive = true
        pOEStar1.bottomAnchor.constraint(equalTo: poeView.bottomAnchor, constant: -5).isActive = true
        pOEStar1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Likeliness to Return Stars
    func createLikelinessToReturnStars(plrView: UIView) {
        
        //Button 5
        pLRStar5.tag = 55
        pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
        pLRStar5.contentMode = .scaleAspectFit
        pLRStar5.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRStar5)
        
        pLRStar5.rightAnchor.constraint(equalTo: plrView.rightAnchor, constant: -5).isActive = true
        pLRStar5.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRStar5.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRStar5.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 4
        pLRStar4.tag = 54
        pLRStar4.image = #imageLiteral(resourceName: "star_Empty")
        pLRStar4.contentMode = .scaleAspectFit
        pLRStar4.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRStar4)
        
        pLRStar4.rightAnchor.constraint(equalTo: pLRStar5.leftAnchor, constant: 10).isActive = true
        pLRStar4.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRStar4.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRStar4.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 3
        pLRStar3.tag = 53
        pLRStar3.image = #imageLiteral(resourceName: "star_Empty")
        pLRStar3.contentMode = .scaleAspectFit
        pLRStar3.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRStar3)
        
        pLRStar3.rightAnchor.constraint(equalTo: pLRStar4.leftAnchor, constant: 10).isActive = true
        pLRStar3.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRStar3.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRStar3.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 2
        pLRStar2.tag = 52
        pLRStar2.image = #imageLiteral(resourceName: "star_Empty")
        pLRStar2.contentMode = .scaleAspectFit
        pLRStar2.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRStar2)
        
        pLRStar2.rightAnchor.constraint(equalTo: pLRStar3.leftAnchor, constant: 10).isActive = true
        pLRStar2.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRStar2.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRStar2.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        //Button 1
        pLRStar1.tag = 51
        pLRStar1.image = #imageLiteral(resourceName: "star_Empty")
        pLRStar1.contentMode = .scaleAspectFit
        pLRStar1.translatesAutoresizingMaskIntoConstraints = false
        
        plrView.addSubview(pLRStar1)
        
        pLRStar1.rightAnchor.constraint(equalTo: pLRStar2.leftAnchor, constant: 10).isActive = true
        pLRStar1.topAnchor.constraint(equalTo: plrView.topAnchor, constant: 5).isActive = true
        pLRStar1.bottomAnchor.constraint(equalTo: plrView.bottomAnchor, constant: -5).isActive = true
        pLRStar1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: Add average rattings to ui
    func addAverageRatings() {
        DispatchQueue.main.async {
            switch self.averageParkQualityScore {
            case 0:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 1:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 2:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 3:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 4:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 5:
                self.pQStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pQStar5.image = #imageLiteral(resourceName: "star_Filled")
            default:
                print("\(String(describing: self.parkDetails?.name)) error with Park Quality averge rating. Current average: \(self.averageParkQualityScore)")
                
            }
            
            switch self.averageParkEquipmentScore {
            case 0:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 1:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 2:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 3:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 4:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 5:
                self.pEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pEStar5.image = #imageLiteral(resourceName: "star_Filled")
            default:
                print("\(String(describing: self.parkDetails?.name)) error with Park Equipment averge rating. Current average: \(self.averageParkEquipmentScore)")
            }
            
            switch self.averageNeighborhoodScore {
            case 0:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 1:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 2:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 3:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 4:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 5:
                self.pNStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pNStar5.image = #imageLiteral(resourceName: "star_Filled")
            default:
                print("\(String(describing: self.parkDetails?.name)) error with Neighborhood averge rating. Current average: \(self.averageNeighborhoodScore)")
            }
            
            switch self.averageOverallEnjoymentScore {
            case 0:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 1:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 2:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 3:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 4:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 5:
                self.pOEStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pOEStar5.image = #imageLiteral(resourceName: "star_Filled")
            default:
                print("\(String(describing: self.parkDetails?.name)) error with Overall Enjoyment averge rating. Current average: \(self.averageOverallEnjoymentScore)")
            }
            
            switch self.averageLikelinessToReturnScore {
            case 0:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 1:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 2:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 3:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Empty")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 4:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Empty")
            case 5:
                self.pLRStar1.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar2.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar3.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar4.image = #imageLiteral(resourceName: "star_Filled")
                self.pLRStar5.image = #imageLiteral(resourceName: "star_Filled")
            default:
                print("\(String(describing: self.parkDetails?.name)) error with Likeliness to Return averge rating. Current average: \(self.averageLikelinessToReturnScore.description)")
            }
        }
    }
    
}
