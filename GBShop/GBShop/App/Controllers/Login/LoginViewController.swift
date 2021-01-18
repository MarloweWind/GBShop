//
//  LoginViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate {
    
    var loginView = LoginView()
    
    override func loadView() {
        loginView.delegate = self
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    func loginPrefermed() {
        
        let vc = RegisterViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
