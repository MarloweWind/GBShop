//
//  BusketStruct.swift
//  GBShop
//
//  Created by Алексей Мальков on 28.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct BusketStruct{
    let productName: String
    let productPrice: Int
    
    init(name: String, price: Int) {
        productName = name
        productPrice = price
    }
}
