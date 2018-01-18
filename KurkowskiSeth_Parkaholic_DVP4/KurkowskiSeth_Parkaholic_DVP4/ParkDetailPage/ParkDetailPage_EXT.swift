//
//  ParkDetailPage_EXT.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/16/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

extension ParkDetail_ViewController {
    
    func createScrollView() {
        DispatchQueue.main.async {
            self.scrollView.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.backgroundColor = UIColor.black
            
            self.view.addSubview(self.scrollView)
            
            //Add constraints to scroll view
            self.scrollView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: 5).isActive = true
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
            
            self.createHeaderRatings()
        }
    }
    
    func createHeaderRatings() {
        //Create page header
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.cyan
        
        view.addSubview(headerView)
        
        //Add constraints to header view
        headerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25).isActive = true
        headerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
        headerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -5).isActive = true
        headerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1, constant: 1).isActive = true
        
        //Create label with name of park
        let headerLbl = UILabel()
        headerLbl.text = parkDetails?.name
        headerLbl.font = UIFont(name: headerLbl.font.fontName, size: 22)
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerLbl)
        
        //Add constraints to header label
        headerLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        //TODO - Add favorite icon
        
        //Create average rating header
        let averageHeaderView = UIView()
        averageHeaderView.translatesAutoresizingMaskIntoConstraints = false
        averageHeaderView.backgroundColor = UIColor.green
        
        view.addSubview(averageHeaderView)
        
        averageHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 25).isActive = true
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
        
        view.addSubview(parkQualityAvgView)
        
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
        
        //TODO: - Add rating stars here for park quality
        let pqAvgLbl = UILabel()
        pqAvgLbl.text = averageParkQualityScore.description
        pqAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        parkQualityAvgView.addSubview(pqAvgLbl)
        pqAvgLbl.rightAnchor.constraint(equalTo: parkQualityAvgView.rightAnchor, constant: -10).isActive = true
        pqAvgLbl.topAnchor.constraint(equalTo: parkQualityAvgView.topAnchor, constant: 5).isActive = true
        
        //Park equipment
        let parkEquipmentAvgView = UIView()
        parkEquipmentAvgView.translatesAutoresizingMaskIntoConstraints = false
        parkEquipmentAvgView.backgroundColor = UIColor.red
        
        view.addSubview(parkEquipmentAvgView)
        
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
        
        //TODO: - Add rating stars here for park equipment
        let peAvgLbl = UILabel()
        peAvgLbl.text = averageParkEquipmentScore.description
        peAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        parkEquipmentAvgView.addSubview(peAvgLbl)
        peAvgLbl.rightAnchor.constraint(equalTo: parkEquipmentAvgView.rightAnchor, constant: -10).isActive = true
        peAvgLbl.topAnchor.constraint(equalTo: parkEquipmentAvgView.topAnchor, constant: 5).isActive = true
        
        //Neighborhood
        let neighborhoodAvgView = UIView()
        neighborhoodAvgView.translatesAutoresizingMaskIntoConstraints = false
        neighborhoodAvgView.backgroundColor = UIColor.red
        
        view.addSubview(neighborhoodAvgView)
        
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
        
        //TODO: - Add rating stars here for neighborhood
        let nAvgLbl = UILabel()
        nAvgLbl.text = averageNeighborhoodScore.description
        nAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        neighborhoodAvgView.addSubview(nAvgLbl)
        nAvgLbl.rightAnchor.constraint(equalTo: neighborhoodAvgView.rightAnchor, constant: -10).isActive = true
        nAvgLbl.topAnchor.constraint(equalTo: neighborhoodAvgView.topAnchor, constant: 5).isActive = true
        
        //Overall Enjoyment
        let overallEnjoymentAvgView = UIView()
        overallEnjoymentAvgView.translatesAutoresizingMaskIntoConstraints = false
        overallEnjoymentAvgView.backgroundColor = UIColor.red
        
        view.addSubview(overallEnjoymentAvgView)
        
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
        
        //TODO: - Add rating stars here for overall enjoyment
        let oeAvgLbl = UILabel()
        oeAvgLbl.text = averageOverallEnjoymentScore.description
        oeAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        overallEnjoymentAvgView.addSubview(oeAvgLbl)
        oeAvgLbl.rightAnchor.constraint(equalTo: overallEnjoymentAvgView.rightAnchor, constant: -10).isActive = true
        oeAvgLbl.topAnchor.constraint(equalTo: overallEnjoymentAvgView.topAnchor, constant: 5).isActive = true
        
        //Likeliness to Return
        let likelinessToReturnAvgView = UIView()
        likelinessToReturnAvgView.translatesAutoresizingMaskIntoConstraints = false
        likelinessToReturnAvgView.backgroundColor = UIColor.red
        
        view.addSubview(likelinessToReturnAvgView)
        
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
        
        //TODO: - Add rating stars here for likeliness to return
        let lrAvgLbl = UILabel()
        lrAvgLbl.text = averageLikelinessToReturnScore.description
        lrAvgLbl.translatesAutoresizingMaskIntoConstraints = false
        likelinessToReturnAvgView.addSubview(lrAvgLbl)
        lrAvgLbl.rightAnchor.constraint(equalTo: likelinessToReturnAvgView.rightAnchor, constant: -10).isActive = true
        lrAvgLbl.topAnchor.constraint(equalTo: likelinessToReturnAvgView.topAnchor, constant: 5).isActive = true
        
        //Create tags header
        let tagsHeaderView = UIView()
        tagsHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tagsHeaderView.backgroundColor = UIColor.green
        
        view.addSubview(tagsHeaderView)
        
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
        
    }
}
