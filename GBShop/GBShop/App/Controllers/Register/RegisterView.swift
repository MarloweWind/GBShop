//
//  RegisterView.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterViewDelegate {
    func registerPush()
}

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
    var fristNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var emailTextField: UITextField!
    var registerFAQ: UILabel!
    
    
    var delegate: RegisterViewDelegate?
    
    let requestFactory = RequestFactory()
    
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
        passwordTextField.placeholder = "Your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordTextField)
        
        fristNameTextField = UITextField(frame: .zero)
        fristNameTextField.placeholder = "Your first name"
        fristNameTextField.borderStyle = .roundedRect
        fristNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(fristNameTextField)
        
        lastNameTextField = UITextField(frame: .zero)
        lastNameTextField.placeholder = "Your last name"
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lastNameTextField)
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.placeholder = "Your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
        
        registerFAQ = UILabel()
        registerFAQ.translatesAutoresizingMaskIntoConstraints = false
        registerFAQ.text = "Enter your data to register"
        registerFAQ.textColor = .black
        registerFAQ.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(registerFAQ)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            
            passwordTextField.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            nameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            fristNameTextField.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -20),
            fristNameTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            fristNameTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            lastNameTextField.bottomAnchor.constraint(equalTo: fristNameTextField.topAnchor, constant: -20),
            lastNameTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            emailTextField.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor, constant: -20),
            emailTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            registerFAQ.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            registerFAQ.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc func handleRegisterTouchUpInseide(){
        let register = requestFactory.makeRegisterRequestFactory()
        
        register.doRegister(login: "nameTextField",
                            password: "passwordTextField",
                            firstName: "fristNameTextField",
                            lastName: "lastNameTextField",
                            email: "emailTextField") { response in
                switch response.result {
            case .success(let register):
                self.delegate?.registerPush()
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
