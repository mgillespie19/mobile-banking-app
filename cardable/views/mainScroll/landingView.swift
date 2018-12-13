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
    
    // ----------------------- FUNCTIONS -----------------------
    
    func setupLandingView() {
        //self.view.addSubview(titleLabel)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(creditCard)
        //scrollView.addSubview(recentTransactions)
        scrollView.addSubview(moneyLabel)
        scrollView.bringSubviewToFront(moneyLabel)
        scrollView.addSubview(plusBtn)
        scrollView.addSubview(cameraBtn)
    }
    
    func setupAutoLayout() {
        let verticalPadding = 50
        let cardWidth = self.view.frame.width * 0.85
        
        //recentTransactions.translatesAutoresizingMaskIntoConstraints = false
        creditCard.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            creditCard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            creditCard.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: self.view.frame.height * 0.25),
            creditCard.widthAnchor.constraint(equalToConstant: cardWidth),
            creditCard.heightAnchor.constraint(equalToConstant: cardWidth * 0.66),
            
//            recentTransactions.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: CGFloat(verticalPadding * 2)),
//            recentTransactions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            recentTransactions.heightAnchor.constraint(equalToConstant: self.scrollView.contentSize.height / 2),
//            recentTransactions.widthAnchor.constraint(equalToConstant: cardWidth * 1.1),
            
            moneyLabel.bottomAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: -15),
            moneyLabel.leftAnchor.constraint(equalTo: creditCard.leftAnchor, constant: self.view.frame.width / 20)
            ])
        
    }
        
    
    @objc func plus() {
        print("elaborate")
    }
    
    @objc func openCamera() {
        print("open camera")
    }
    
    
    // ----------------------- LABELS -----------------------
    lazy var moneyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1,321.74"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Courier New", size: 30)
        label.textAlignment = .left
        return label
    }()
    
    
    // ----------------------- BUTTONS -----------------------
    
    lazy var plusBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width - self.view.frame.width / 5 - self.view.frame.width / 15, y: self.view.frame.height / 25, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 30)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = self.view.frame.width / 10
        button.layer.masksToBounds = true
        //button.backgroundColor = Preferences.moneyGreen
        button.backgroundColor = UIColor(displayP3Red: 200/255, green: 200/255, blue: 200/255, alpha: 0.7)
        button.addTarget(self, action: #selector(plus), for: .touchDown)
        return button
    }()
    
    lazy var cameraBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width / 15, y: self.view.frame.height / 25, width: self.view.frame.width / 5, height: self.view.frame.width / 5))
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 30)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = self.view.frame.width / 10
        button.layer.masksToBounds = true
        //button.backgroundColor = Preferences.moneyGreen
        button.backgroundColor = UIColor(displayP3Red: 200/255, green: 200/255, blue: 200/255, alpha: 0.7)
        button.addTarget(self, action: #selector(openCamera), for: .touchDown)
        return button
    }()
    
    
    // ----------------------- VIEWS -----------------------
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        scroll.delegate = self
        scroll.isScrollEnabled = true
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = false
        scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.5)
        
        return scroll
    }()
    
    lazy var creditCard:UIImageView = {
        let img = UIImage(named: "landingCardNoDate")
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
