//
//  ViewController.swift
//  cardable
//
//  Created by Max Gillespie on 11/16/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let landingView = self.storyboard!.instantiateViewController(withIdentifier: "LV")
        let creditView = self.storyboard!.instantiateViewController(withIdentifier: "CV")
        let debitView = self.storyboard!.instantiateViewController(withIdentifier: "DV")
        
        self.addChild(landingView)
        self.scrollView.addSubview(landingView.view)
        landingView.didMove(toParent: self)
        
        self.addChild(creditView)
        self.scrollView.addSubview(creditView.view)
        creditView.didMove(toParent: self)
        
        self.addChild(debitView)
        self.scrollView.addSubview(debitView.view)
        debitView.didMove(toParent: self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: 0)
        creditView.view.frame.origin.x = 0
        landingView.view.frame.origin.x = self.view.frame.width
        debitView.view.frame.origin.x = self.view.frame.width * 2
        
        self.scrollView.contentOffset = CGPoint(x: self.view.frame.width, y:0)
    }

}

