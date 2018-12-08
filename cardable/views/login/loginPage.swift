//
//  LoginPage.swift
//

import UIKit

class LoginPageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLoginPageCell()
        setUpAutoLayout()
    }
    
    func setUpLoginPageCell(){
        //backgroundColor = .white
        //addSubview(scrollView)
        //scrollView.addSubview(loginButton)
        addSubview(logoImageView)
        addSubview(loginButton)
        addSubview(titleLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(needAccountButton)
        addSubview(forgotPasswordButton)
        needAccountButton.addTarget(self, action: #selector(needAccount), for: .touchDown)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPassword), for: .touchDown)
        createGradientLayer(v: self, colors: [Preferences.secondaryColor.cgColor, UIColor.white.cgColor], rotation: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0)], locations: [0, 1])
    }
    
    
    let scrollView: UIView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "cardable")
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "welcome to cardable"
        label.textColor = Preferences.accentColor
        label.font = label.font.withSize(30)
        label.textAlignment = .left
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
        textField.backgroundColor = Preferences.gray
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = UIKeyboardType.default
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = Preferences.gray
        //read documentation on this
        //textField.passwordRules
        return textField
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = Preferences.moneyGreen
        button.addTarget(self, action: #selector(loginUser), for: .touchDown)
        return button
    }()
    
    let needAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Need Account?", for: .normal)
        button.setTitleColor(Preferences.accentColor, for: .normal)
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        return button
    }()
    
    
    func setUpAutoLayout(){
        let verticalPadding:CGFloat = 20
        
        //enable auto layout
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        needAccountButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        //activate constraints
        NSLayoutConstraint.activate([
            //constraints for the scroll view
            //            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            //            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            //            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            //            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            //constraints for the logo
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.heightAnchor.constraint(equalToConstant: 275),
            logoImageView.widthAnchor.constraint(equalToConstant: 240),
            
            //constraints for the title
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //constraints for the username
            usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalPadding*2),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the password
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: verticalPadding),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the login button
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: verticalPadding),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the new account
            needAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            needAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: verticalPadding/2),
            needAccountButton.heightAnchor.constraint(equalToConstant: 20),
            needAccountButton.widthAnchor.constraint(equalToConstant: 300),
            
            //constraints for the forgot password
            forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            forgotPasswordButton.topAnchor.constraint(equalTo: needAccountButton.bottomAnchor, constant: verticalPadding/2),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 300),
            
            
            ])
    }
    
    //var startController: StartController?
    var delegate: StartControllerDelegate?
    
    //function to login the user and reroute to the starting tab bar controller
    @objc func loginUser(){
        
        //loginButton.shake()
        
        //need to some how refrence the current start controller and not a new one
        //startController?.login()
        delegate?.login()
        
    }
    
    @objc func needAccount(){
        delegate?.animateToPage(pageIndex: 1)
        
    }
    
    @objc func forgotPassword(){
        print("Forgot Password")
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
