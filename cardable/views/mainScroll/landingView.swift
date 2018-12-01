//
//  landingView.swift
//  cardable
//
//  Created by Max Gillespie on 11/16/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import UIKit

class landingView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createGradientLayer(v: self.view, colors: [Preferences.accentColor.cgColor, Preferences.primaryColor.cgColor], rotation: Preferences.gradientPref, locations: [0, 1])
        
        setupLandingView()
    }
    
    func setupLandingView() {
        
    }
}
