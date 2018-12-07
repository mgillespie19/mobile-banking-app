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
        scrollView.addSubview(recentTransactions)
        scrollView.addSubview(moneyLabel)
        scrollView.bringSubviewToFront(moneyLabel)
    }
    
    func setupAutoLayout() {
        let verticalPadding = 50
        let cardWidth = self.view.frame.width * 0.85
        
        recentTransactions.translatesAutoresizingMaskIntoConstraints = false
        creditCard.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            creditCard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            creditCard.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: self.view.frame.height * 0.2),
            creditCard.widthAnchor.constraint(equalToConstant: cardWidth),
            creditCard.heightAnchor.constraint(equalToConstant: cardWidth * 0.66),
            
            recentTransactions.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: CGFloat(verticalPadding * 2)),
            recentTransactions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            recentTransactions.heightAnchor.constraint(equalToConstant: self.scrollView.contentSize.height / 2),
            recentTransactions.widthAnchor.constraint(equalToConstant: cardWidth * 1.1),
            
            moneyLabel.topAnchor.constraint(equalTo: creditCard.topAnchor, constant: 60),
            moneyLabel.leftAnchor.constraint(equalTo: creditCard.leftAnchor, constant: self.view.frame.width / 4)
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
    
    lazy var moneyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1,321.74"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica Bold", size: 55)
        label.textAlignment = .left
        return label
    }()
    
    lazy var creditCard:UIImageView = {
        let img = UIImage(named: "landingCard")
        let creditCard = UIImageView(frame: .zero)
        
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
        let title = UILabel(frame: CGRect(x: self.view.frame.width / 16, y: 15, width: self.view.frame.width, height: 40))
        
        title.text = "recent transactions"
        title.textColor = UIColor.black
        title.font = UIFont(name: "Helvetica Bold", size: 30)
        title.textAlignment = .left
        
        recent.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        recent.cornerRadius = 5
        recent.layer.shadowColor = UIColor.black.cgColor
        recent.layer.shadowOpacity = 0.6
        recent.layer.shadowOffset = CGSize.zero
        recent.layer.shadowRadius = 20
        recent.addSubview(title)
        
        return recent
    }()
}
