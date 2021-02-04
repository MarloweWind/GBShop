//
//  ProductDetailViewController.swift
//  GBShop
//
//  Created by Алексей Мальков on 25.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    var productNameLabel: UILabel!
    var productPriceLabel: UILabel!
    var productReviewLabel: UILabel!
    var addToCartButton: UIButton!
    
    var productName: String?
    var productPrice: String?
    var productPriceInt: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        productNameLabel = UILabel()
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.text = productName
        productNameLabel.textColor = .black
        productNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(productNameLabel)
        
        productPriceLabel = UILabel()
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.text = "Цена:\(productPrice!)"
        productPriceLabel.textColor = .black
        productPriceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(productPriceLabel)
        
        productReviewLabel = UILabel()
        productReviewLabel.translatesAutoresizingMaskIntoConstraints = false
        productReviewLabel.text = "productReview"
        productReviewLabel.textColor = .black
        productReviewLabel.font = UIFont.boldSystemFont(ofSize: 17)
        view.addSubview(productReviewLabel)
        
        addToCartButton = UIButton(type: .system)
        addToCartButton.setTitle("Добавть в корзину", for: .normal)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addToCartButton)
        addToCartButton.addTarget(self,
                              action: #selector(handleAddToCartTouchUpInseide),
                              for: .touchUpInside)
        
        constraintsInit()
        getReview()
        analytics(state: "Catalog")        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            
            productNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: 50),
            productPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productReviewLabel.topAnchor.constraint(equalTo: productPriceLabel.topAnchor, constant: 50),
            productReviewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addToCartButton.topAnchor.constraint(equalTo: productReviewLabel.topAnchor, constant: 50),
            addToCartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func getReview(){
        let review = requestFactory.makeReviewRequestFactory()
        
            review.doApproveReview(){ response in
            switch response.result {
            case .success(let register):
                print(register)
                self.productReviewLabel.text = "Хороший выбор"
                analytics(state: "Review added")
            case .failure(let error):
                print(error.localizedDescription)
                self.productReviewLabel.text = "Техника низкого качества"
            }
        }
    }
    
    @objc func handleAddToCartTouchUpInseide(){
        let basket = requestFactory.makeBasketFactory()
        
        basket.addProductToBasketBy(productId: 123, sessionId: 123, quantity: 1) { response in
            print("Add to basket")
            switch response.result {
            case .success(let addToBasketResult):
                print(addToBasketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let alert = UIAlertController(title: "", message: "Товар добавлен в корзину", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true)
        
        BasketSession.shared.productName = productName!
        BasketSession.shared.productPrice = productPriceInt!
    }


}
