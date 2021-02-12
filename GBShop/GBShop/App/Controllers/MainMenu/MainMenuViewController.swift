//
//  MainMenuViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 23.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, MainMenuViewDelegate {

    var mainMenuView = MainMenuView()
    
    override func loadView() {
        mainMenuView.delegate = self
        view = mainMenuView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isAccessibilityElement = true
        navigationController?.navigationBar.accessibilityIdentifier = "mainmenu"
        analytics(state: "Login")
    }
    
    func catalogPush() {
        let vc = CatalogTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func changeUserDataPush() {
        let vc = ChangeUserDataViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func logOutPush() {
        navigationController?.popViewController(animated: true)
        analytics(state: "Logout")
    }

}
