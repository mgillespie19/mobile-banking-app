//
//  functions.swift
//  cardable
//
//  Created by Max Gillespie on 11/17/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import Foundation
import UIKit

func createGradientLayer(v: UIView, colors:[CGColor], rotation:[CGPoint], locations: [NSNumber]) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = v.bounds
    gradientLayer.colors = colors
    gradientLayer.locations = locations
    gradientLayer.startPoint = rotation[0]
    gradientLayer.endPoint = rotation[1]
    
    v.layer.insertSublayer(gradientLayer, at: 0)
}

func createGradientBlockLayer(v: UIView, top:CGColor, bottom:CGColor) ->UIColor{
    let view = Divider(frame: v.bounds)
    let midColor = view.fill(top:top, bottom:bottom)

    v.insertSubview(view, at: 0)
    
    return midColor
}
