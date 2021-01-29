//
//  MainMenuView.swift
//  GBShop
//
//  Created by Алексей Мальков on 23.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit
import Alamofire

protocol MainMenuViewDelegate {
    func catalogPush()
    func changeUserDataPush()
    func logOutPush()
}

class MainMenuView: UIView{
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
    
    var catalogButton: UIButton!
    var changeUserDataButton: UIButton!
    var logOutButton: UIButton!
    var mainMenuLabel: UILabel!
    
    var delegate: MainMenuViewDelegate?
    
    let requestFactory = RequestFactory()
    
    func createSubviews(){
        
        backgroundColor = .white
        
        catalogButton = UIButton(type: .system)
        catalogButton.setTitle("Каталог", for: .normal)
        catalogButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(catalogButton)
        catalogButton.addTarget(self,
                              action: #selector(handleCatalogTouchUpInseide),
                              for: .touchUpInside)
        
        changeUserDataButton = UIButton(type: .system)
        changeUserDataButton.setTitle("Изменить пароль", for: .normal)
        changeUserDataButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(changeUserDataButton)
        changeUserDataButton.addTarget(self,
                              action: #selector(handleChangeUserDataTouchUpInseide),
                              for: .touchUpInside)
        
        logOutButton = UIButton(type: .system)
        logOutButton.setTitle("Выйти из аккаунта", for: .normal)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logOutButton)
        logOutButton.addTarget(self,
                              action: #selector(handleLogOutTouchUpInseide),
                              for: .touchUpInside)
        
        mainMenuLabel = UILabel()
        mainMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        mainMenuLabel.text = "GBShop"
        mainMenuLabel.isAccessibilityElement = true
        mainMenuLabel.accessibilityIdentifier = "MainMenu"
        mainMenuLabel.textColor = .purple
        mainMenuLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.addSubview(mainMenuLabel)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            catalogButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            catalogButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            
            changeUserDataButton.topAnchor.constraint(equalTo: catalogButton.bottomAnchor, constant: 10),
            changeUserDataButton.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            changeUserDataButton.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            logOutButton.topAnchor.constraint(equalTo: changeUserDataButton.bottomAnchor, constant: 10),
            logOutButton.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            logOutButton.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20),
            
            mainMenuLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            mainMenuLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    @objc func handleCatalogTouchUpInseide(){
        delegate?.catalogPush()
    }
    
    @objc func handleChangeUserDataTouchUpInseide(){
        delegate?.changeUserDataPush()
    }
    
    @objc func handleLogOutTouchUpInseide(){
        let auth = requestFactory.makeAuthRequestFactory()
        
            auth.logout { response in
                switch response.result {
                case .success(let logout):
                    print(logout)
                    self.delegate?.logOutPush()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }        
    }
    
}
