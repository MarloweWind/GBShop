//
//  ChangeUserDataView.swift
//  GBShop
//
//  Created by Алексей Мальков on 23.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit
import Alamofire

protocol ChangeUserDataViewDelegate {
    func backPush()
}

class ChangeUserDataView: UIView{
    
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
        
    var changeUserDataButton: UIButton!
    var newPasswordTextField: UITextField!

    var delegate: ChangeUserDataViewDelegate?
    
    let requestFactory = RequestFactory()
        
    func createSubviews(){
        
        backgroundColor = .white
        
        changeUserDataButton = UIButton(type: .system)
        changeUserDataButton.setTitle("Change password", for: .normal)
        changeUserDataButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(changeUserDataButton)
        changeUserDataButton.addTarget(self,
                              action: #selector(handleBackTouchUpInseide),
                              for: .touchUpInside)
        
        newPasswordTextField = UITextField(frame: .zero)
        newPasswordTextField.placeholder = "New password"
        newPasswordTextField.borderStyle = .roundedRect
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(newPasswordTextField)
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            changeUserDataButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            changeUserDataButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            newPasswordTextField.bottomAnchor.constraint(equalTo: changeUserDataButton.topAnchor, constant: -20),
            newPasswordTextField.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 20),
            newPasswordTextField.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor, constant: -20)

        ])
    }
    
    @objc func handleBackTouchUpInseide(){
        let change = requestFactory.makeChangeUserDataRequestFactory()
        
        change.doChange(login: newPasswordTextField.text!, password: "", firstName: "", lastName: "", email: "") { response in
                switch response.result {
                case .success(let change):
                    print(change)
                    self.delegate?.backPush()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

    }
    
}
