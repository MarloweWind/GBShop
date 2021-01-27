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
        navigationController?.navigationBar.isHidden = true
    }
    
    func loginPush() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func registerPush() {
        let vc = MainMenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
