//
//  Product.swift
//  GBShop
//
//  Created by Алексей Мальков on 25.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
        case result = "result"
    }
    
}
