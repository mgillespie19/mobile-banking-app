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

        
        setupLandingView()
        setupAutoLayout()
    }
    
    func setupLandingView() {
        self.view.addSubview(titleLabel)
    }
    
    func setupAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate( [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: -250),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "landing page"
        label.textColor = Preferences.accentColor
        label.font = label.font.withSize(30)
        label.textAlignment = .left
        return label
    }()
}
