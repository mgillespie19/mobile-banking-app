//
//  functions.swift
//  cardable
//
//  Created by Max Gillespie on 11/17/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import Foundation
import UIKit

func createGradientLayer(v: UIView, top: CGColor, bottom: CGColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = v.bounds
    gradientLayer.colors = [top, bottom]
    //v.layer.addSublayer(gradientLayer)
    v.layer.insertSublayer(gradientLayer, at: 0)
}
