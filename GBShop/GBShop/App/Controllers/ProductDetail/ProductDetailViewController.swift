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
    
    var productName: String?
    var productPrice: String?
    

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
        
        constraintsInit()
        getReview()
        
        
    }
    
    func constraintsInit(){
        NSLayoutConstraint.activate([
            
            productNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: 50),
            productPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productReviewLabel.topAnchor.constraint(equalTo: productPriceLabel.topAnchor, constant: 50),
            productReviewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    func getReview(){
        let review = requestFactory.makeReviewRequestFactory()
        
            review.doApproveReview(){ response in
                switch response.result {
                case .success(let register):
                    print(register)
                    self.productReviewLabel.text = "Хороший выбор"
                case .failure(let error):
                    print(error.localizedDescription)
                    self.productReviewLabel.text = "Техника низкого качества"
                }
            }
    }


}
