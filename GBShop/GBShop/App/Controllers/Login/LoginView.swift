//
//  LoginView.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewDelegate {
    func loginPrefermed()
}

class LoginView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        constraintsInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
        constraintsInit()
    }
        
    var loginButton: UIButton!
    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var registerButton: UIButton!
    var appNameLabel: UILabel!
    
    var delegate: LoginViewDelegate?
    

    
    func createSubviews(){
        
        backgroundColor = .white
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
        loginButton.addTarget(self,
                              action: #selector(handleRegisterTouchUpInseide),
                              for: .touchUpInside)
        
        nameTextField = UITextField(frame: .zero)
        nameTextField.placeholder = "Login"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
        
        registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerButton)
        registerButton.addTarget(self,
                              action: #selector(handleRegisterTouchUpInseide),
                              for: .touchUpInside)
        
        appNameLabel = UILabel()
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "GBShop"
        appNameLabel.textColor = .purple
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.addSubview(appNameLabel)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            nameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            appNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            appNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc func handleLoginTouchUpInseide(){
        print("Login has beeen tapped")
        if nameTextField.isFirstResponder{
            nameTextField.resignFirstResponder()
        }
        print(nameTextField.text!)
        if passwordTextField.isFirstResponder{
            passwordTextField.resignFirstResponder()
        }
        print(passwordTextField.text!)
    }
    
    @objc func handleRegisterTouchUpInseide(){
        
        delegate?.loginPrefermed()
    }
    
}
