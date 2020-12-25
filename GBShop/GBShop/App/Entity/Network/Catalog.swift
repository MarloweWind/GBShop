//
//  Catalog.swift
//  GBShop
//
//  Created by Алексей Мальков on 25.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation

typealias Catalog = [CatalogArray]

struct CatalogArray: Codable {
    let productId: Int
    let productName: String
    let productPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
    
}
