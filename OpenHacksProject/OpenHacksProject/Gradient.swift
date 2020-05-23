//
//  Gradient.swift
//  OpenHacksProject
//
//  Created by Rahul Rao on 5/23/20.
//  Copyright © 2020 OpenHacks Project. All rights reserved.
//

import Foundation
import UIKit


extension UIView{
    func setGradientBackground(colorOne: UIColor, colortwo: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colortwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x : 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y:0.0)
        layer.insertSublayer(gradientLayer, at:0)
    }
}

