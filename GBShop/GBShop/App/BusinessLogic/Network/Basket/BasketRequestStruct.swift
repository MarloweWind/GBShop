//
//  BasketRequestStruct.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

extension Basket{
    
    struct GetBasketData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getBasket.json"
        
        let sessionId: Int
        var parameters: Parameters? {
            return [
                "sessionId": sessionId
            ]
        }
    }
    
    struct AddToBasketData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "addToBasket.json"
        
        let sessionId: Int
        let productId: Int
        let quantity: Int
        
        var parameters: Parameters? {
            return [
                "sessionId": sessionId,
                "productId": productId,
                "quantity": quantity
            ]
        }
    }
    
    struct RemoveFromBasketData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "deleteFromBasket.json"
        
        let sessionId: Int
        let productId: Int
        
        var parameters: Parameters? {
            return [
                "sessionId": sessionId,
                "productId": productId
            ]
        }
    }
    
    struct PayOrderData: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "pay"
        
        let sessionId: Int
        let paySumm: Int
        
        var parameters: Parameters? {
            return [
                "sessionId": sessionId,
                "paySumm": paySumm
            ]
        }
    }
}
