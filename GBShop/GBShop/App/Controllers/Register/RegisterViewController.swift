//
//  RegisterViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewDelegate {

    var registerView = RegisterView()
    
    override func loadView() {
        registerView.delegate = self
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureNavigationController(){
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func registerPush() {
        navigationController?.popViewController(animated: true)
    }

}
