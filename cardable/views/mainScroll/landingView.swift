//
//  landingView.swift
//  cardable
//
//  Created by Max Gillespie on 11/16/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import UIKit

class landingView: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor.red
        print("landing view did load")
        
        setupLandingView()
        setupAutoLayout()
    }
    
    func setupLandingView() {
        //self.view.addSubview(titleLabel)
        self.view.addSubview(scrollView)
        scrollView.addSubview(creditCard)
    }
    
    func setupAutoLayout() {
        let verticalPadding = 25
        
        recentTransactions.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            recentTransactions.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: CGFloat(verticalPadding)),
//            recentTransactions.heightAnchor.constraint(equalToConstant: self.view.frame.width * 0.9),
//            recentTransactions.widthAnchor.constraint(equalToConstant: self.view.frame.height),
//            recentTransactions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
    }
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        scroll.delegate = self
        scroll.isScrollEnabled = true
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = false
        scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.5)
        
        return scroll
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.frame.width/4, y: self.view.frame.height/4, width: 200, height: 200))
        label.text = "landing page"
        label.textColor = UIColor.white
        label.font = label.font.withSize(30)
        label.textAlignment = .left
        return label
    }()
    
    lazy var creditCard:UIImageView = {
        let img = UIImage(named: "landingCard")
        let w = self.view.frame.width * 0.85
        let creditCard = UIImageView(frame: CGRect(x: self.view.frame.width * 0.075, y: self.view.frame.height * 0.2, width: w, height: w * 0.66 ))
        
        //creditCard.transform = CGAffineTransform(rotationAngle: -1 * .pi / 25)
        creditCard.image = img
        
        creditCard.layer.shadowColor = UIColor.black.cgColor
        creditCard.layer.shadowOpacity = 0.8
        creditCard.layer.shadowOffset = CGSize.zero
        creditCard.layer.shadowRadius = 13
        
        return creditCard
    }()
    
    lazy var recentTransactions:UIView = {
        let recent = UIView(frame: .zero)
        
        
        
        return recent
    }()
}
