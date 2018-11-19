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
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}


class Divider: UIView{
    var blocks:CGFloat = 5
    
    override func draw(_ rect: CGRect) {
        
    }
    
    func fill(top: CGColor, bottom: CGColor) ->UIColor{
        var midColor = UIColor.white
        
        // I want n gray colors on the spectrum rgb(0,0,0) to rgb(200,200,200)
        for level in 1...Int(blocks) {
            let ratio = CGFloat(level) / CGFloat(blocks)
            let layer = UIView(frame: CGRect(origin: CGPoint(x: 0, y: self.frame.height - self.frame.height * ratio), size: CGSize(width: self.frame.width, height: self.frame.height / blocks)))
            
            layer.backgroundColor = UIColor(displayP3Red: ratio * 45 / 255 , green: ratio * 45 / 255, blue: ratio * 40 / 255, alpha: 1)
            if (level == Int(blocks/2)) {
                midColor = UIColor(displayP3Red: ratio * 45 / 255 , green: ratio * 45 / 255, blue: ratio * 40 / 255, alpha: 1)
            }
            
            self.addSubview(layer)
        }
        
        return midColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
    }
}
