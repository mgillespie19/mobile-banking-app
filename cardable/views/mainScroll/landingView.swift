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
        
        //self.view.backgroundColor = UIColor.red
        print("landing view did load")
        
        setupLandingView()
        setupAutoLayout()
    }
    
    func setupLandingView() {
        self.view.addSubview(titleLabel)

    }
    
    func setupAutoLayout() {
        //titleLabel.translatesAutoresizingMaskIntoConstraints = false

    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.frame.width/4, y: self.view.frame.height/4, width: 200, height: 200))
        label.text = "landing page"
        label.textColor = UIColor.white
        label.font = label.font.withSize(30)
        label.textAlignment = .left
        return label
    }()
}
