//
//  loginView.swift
//  cardable
//
//  Created by Max Gillespie on 11/18/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import UIKit

class loginView: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginBgd: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGradientLayer(v: self.loginBgd, top: UIColor.white.cgColor, bottom: UIColor.black.cgColor)
        
        self.loginBtn.bringSubviewToFront(self.view)
        
        username.delegate = self
        password.delegate = self
    }

    @IBAction func userLogin(_ sender: Any) {
        print("Login")
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
