//
//  AnimatedView.swift
//  KurkowskiSeth_Parkaholic_DVP4
//
//  Created by Seth Kurkowski on 1/17/18.
//  Copyright © 2018 Seth Kurkowski. All rights reserved.
//

import UIKit

class AnimatedViewClass: UIView {

    func leaveScreen() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.5
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x - 500, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
