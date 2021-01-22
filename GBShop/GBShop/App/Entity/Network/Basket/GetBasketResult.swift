//
//  GetBasketResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 14.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct GetBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [BasketContents]
}

struct BasketContents: Codable {
    let idProduct, productPrice, quantity: Int
    let productName: String
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case productPrice = "price"
        case quantity = "quantity"
    }
}
