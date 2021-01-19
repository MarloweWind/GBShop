//
//  CatalogView.swift
//  GBShop
//
//  Created by Алексей Мальков on 19.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import UIKit

class CatalogView: UIView{
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
        
    var registerFAQ: UILabel!
    
    func createSubviews(){
        
        backgroundColor = .white
        
        registerFAQ = UILabel()
        registerFAQ.translatesAutoresizingMaskIntoConstraints = false
        registerFAQ.text = "catalog placeholder"
        registerFAQ.textColor = .black
        registerFAQ.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(registerFAQ)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            registerFAQ.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            registerFAQ.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
