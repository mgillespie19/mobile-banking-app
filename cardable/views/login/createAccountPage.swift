//
//  CreateAccountPage.swift
//  myEhrBeta
//
//  Created by Brad Hodkinson on 11/24/18.
//  Copyright © 2018 Brad Hodkinson. All rights reserved.
//

import UIKit

class CreateAccountPageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCreateAccountPageCell()
    }
    
    func setUpCreateAccountPageCell(){
        //backgroundColor = Preferences.primaryColor
        createGradientLayer(v: self, colors: [Preferences.accentColor.cgColor, Preferences.primaryColor.cgColor], rotation: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0)], locations: [0, 1])
        addSubview(titleLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(reEnterPasswordTextField)
        addSubview(createAccountButton)
        addSubview(alreadyHaveAccountButton)
        
        createAccountButton.addTarget(self, action: #selector(createNewAccount), for: .touchDown)
        alreadyHaveAccountButton.addTarget(self, action: #selector(alreadyHaveAccount), for: .touchDown)
        
        setUpAutoLayout()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Create Account"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = label.font.withSize(26)
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.autocapitalizationType = .none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = UIKeyboardType.default
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    let reEnterPasswordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = UIKeyboardType.default
        textField.placeholder = "Reenter Password"
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.gray
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already Have An Account?", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        return button
    }()
    
    func setUpAutoLayout(){
        //enable auto layout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        reEnterPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalPadding: CGFloat = 20
        
        //activate constraints
        NSLayoutConstraint.activate([
            
            //constraints for the title
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the username
            usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalPadding),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the password
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: verticalPadding),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the password
            reEnterPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            reEnterPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: verticalPadding),
            reEnterPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            reEnterPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the create account button
            createAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            createAccountButton.topAnchor.constraint(equalTo: reEnterPasswordTextField.bottomAnchor, constant: verticalPadding),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            createAccountButton.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the already have account button
            alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            alreadyHaveAccountButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: verticalPadding/2),
            alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 40),
            alreadyHaveAccountButton.widthAnchor.constraint(equalToConstant: 300),
            
            
            
            ])
    }
    
    var delegate: StartControllerDelegate?
    
    @objc func createNewAccount(){
        print("create account")
        createAccountButton.shake()
    }
    
    @objc func alreadyHaveAccount(){
        print("Already Have Account")
        delegate?.animateToPage(pageIndex: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
