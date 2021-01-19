//
//  CatalogViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    
    var catalogView = CatalogView()
    
    override func loadView() {
        view = catalogView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationController()
        
    }
    
    private func configureNavigationController(){
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.largeTitleDisplayMode = .never
    }

}
