//
//  viewExtensions.swift
//  myMoney-AR
//
//  Created by Max Gillespie on 11/15/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
