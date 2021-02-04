//
//  BasketViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 28.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    var productNameLabel: UILabel!
    var productPriceLabel: UILabel!
    var moneyTextField: UITextField!
    var payButton: UIButton!
    var clearButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        productNameLabel = UILabel()
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.text = BasketSession.shared.productName
        productNameLabel.textColor = .black
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(productNameLabel)
        
        productPriceLabel = UILabel()
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.text = String(BasketSession.shared.productPrice)
        productPriceLabel.textColor = .black
        productPriceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(productPriceLabel)
        
        moneyTextField = UITextField(frame: .zero)
        moneyTextField.placeholder = "Ввод денежных средств"
        moneyTextField.borderStyle = .roundedRect
        moneyTextField.translatesAutoresizingMaskIntoConstraints = false
        moneyTextField.keyboardType = .numberPad
        view.addSubview(moneyTextField)
        
        payButton = UIButton(type: .system)
        payButton.setTitle("Оплатить", for: .normal)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payButton)
        payButton.addTarget(self,
                              action: #selector(handlePayTouchUpInseide),
                              for: .touchUpInside)
        
        clearButton = UIButton(type: .system)
        clearButton.setTitle("Очистить корзину", for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clearButton)
        clearButton.addTarget(self,
                              action: #selector(handleClearTouchUpInseide),
                              for: .touchUpInside)
        
        let basket = requestFactory.makeBasketFactory()
        
        basket.getBasketBy(sessionId: 123) { response in
            print("Basket")
            switch response.result {
            case .success(let basketResult):
                print(basketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        constraintsInit()
        analytics(state: "Basket loaded")
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            
            productNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: 50),
            productPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            moneyTextField.topAnchor.constraint(equalTo: productPriceLabel.topAnchor, constant: 50),
            moneyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            payButton.topAnchor.constraint(equalTo: moneyTextField.topAnchor, constant: 50),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            clearButton.topAnchor.constraint(equalTo: payButton.topAnchor, constant: 50),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    @objc func handlePayTouchUpInseide(){
        let basket = requestFactory.makeBasketFactory()
        let moneyTextFieldInt: Int? = Int(moneyTextField.text!)
        
        basket.payOrderBy(sessionId: 123, paySumm: 2000) { response in
            print("Pay basket")
            if moneyTextFieldInt != BasketSession.shared.productPrice{
                let alert = UIAlertController(title: "", message: "Недостаточно средств", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
                self.present(alert, animated: true)
                analytics(state: "Basket paided")
            }
            switch response.result {
            case .success(let payBasketResult):
                print(payBasketResult)
                let alert = UIAlertController(title: "", message: "Товар оплачен", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
                self.present(alert, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func handleClearTouchUpInseide(){
        let basket = requestFactory.makeBasketFactory()
        
        basket.removeProductFromBasketBy(productId: 123, sessionId: 123) { response in
            print("Remove from basket")
            switch response.result {
            case .success(let removeFromBasketResult):
                print(removeFromBasketResult)
                BasketSession.shared.productPrice = 0
                BasketSession.shared.productName = ""
                self.productNameLabel.text = ""
                self.productPriceLabel.text = String("")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        analytics(state: "Basket cleared")
    }

}
