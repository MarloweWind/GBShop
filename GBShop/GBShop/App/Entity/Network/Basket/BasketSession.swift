//
//  BasketSession.swift
//  GBShop
//
//  Created by Алексей Мальков on 28.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

class BasketSession {
    
    static let instance = BasketSession()
    static let shared: BasketSession = .init()
    
    private init() {}
    
    var productName: String = ""
    var productPrice: Int = 0
    
}
