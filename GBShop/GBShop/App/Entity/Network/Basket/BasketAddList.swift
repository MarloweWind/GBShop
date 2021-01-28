//
//  BasketAddList.swift
//  GBShop
//
//  Created by Алексей Мальков on 28.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

class BasketAddList{
    
    var list = [BusketStruct]()
    
    init(){
        
        let product = BasketSession.shared
        
        let item = BusketStruct(name: product.productName, price: product.productPrice)
        
        list.append(item)
    }
}
