//
//  ChangeUserDataViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 23.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class ChangeUserDataViewController: UIViewController, ChangeUserDataViewDelegate {

    var changeUserDataView = ChangeUserDataView()
    
    override func loadView() {
        changeUserDataView.delegate = self
        view = changeUserDataView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
    }
    
    func backPush() {
        navigationController?.popViewController(animated: true)
        analytics(state: "Change user data")
    }

}
