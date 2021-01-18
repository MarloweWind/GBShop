//
//  RegisterView.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import UIKit

class RegisterView: UIView{
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
        
    var registerButton: UIButton!
    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var registerFAQ: UILabel!
    
    func createSubviews(){
        
        backgroundColor = .white
        
        registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerButton)
        registerButton.addTarget(self,
                              action: #selector(handleRegisterTouchUpInseide),
                              for: .touchUpInside)
        
        nameTextField = UITextField(frame: .zero)
        nameTextField.placeholder = "Your login"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameTextField)
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.placeholder = "Your assword"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
        
        registerFAQ = UILabel()
        registerFAQ.translatesAutoresizingMaskIntoConstraints = false
        registerFAQ.text = "Enter your login and password to register"
        registerFAQ.textColor = .black
        registerFAQ.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(registerFAQ)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            passwordTextField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            nameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            registerFAQ.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            registerFAQ.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc func handleRegisterTouchUpInseide(){
        print("Register has beeen tapped")
        if nameTextField.isFirstResponder{
            nameTextField.resignFirstResponder()
        }
        print(nameTextField.text!)
        if passwordTextField.isFirstResponder{
            passwordTextField.resignFirstResponder()
        }
        print(passwordTextField.text!)
    }
    
}
