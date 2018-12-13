//
//  ButtonAnimations.swift
//  myEhrBeta
//
//  Created by Brad Hodkinson on 11/25/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIButton {
    
    //function to shake a button if user enters a wrong password
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 3
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 6, y: center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: center.x + 6, y: center.y))
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        layer.add(shake, forKey: nil)
    }
    
    class BounceButton: UIButton {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity}, completion: nil)
            }
        }   
}
