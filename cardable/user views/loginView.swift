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
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGradientLayer(v: self.view, colors: [UIColor(displayP3Red: 0.2, green: 0.1, blue: 0.5, alpha: 1).cgColor, UIColor.white.cgColor], rotation: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0)], locations: [0, 1])
        
        
        self.loginBtn.bringSubviewToFront(self.view)
        setupTextFields()
    }

    @IBAction func userLogin(_ sender: Any) {
        print("Login")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setupTextFields() {
        usernameField.delegate = self
        passwordField.delegate = self
    }
}
