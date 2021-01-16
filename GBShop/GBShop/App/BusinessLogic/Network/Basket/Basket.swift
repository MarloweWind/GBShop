//
//  Basket.swift
//  GBShop
//
//  Created by Алексей Мальков on 14.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory{
    
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    let mocUrl = URL(string: "https://safe-sands-78717.herokuapp.com/basket/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility))
    {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }    
}

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

extension Basket: BasketRequestFactory {
    func getBasketBy(sessionId: Int, completion: @escaping (DataResponse<GetBasketResult>) -> Void) {
        let requestModel = GetBasketData(baseUrl: baseUrl, sessionId: sessionId)
        self.request(request: requestModel, completionHandler: completion)
    }
    
    func addProductToBasketBy(productId: Int, sessionId: Int, quantity: Int, completion: @escaping (DataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasketData(baseUrl: baseUrl, sessionId: sessionId,
                                           productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHandler: completion)
    }
    
    func removeProductFromBasketBy(productId: Int, sessionId: Int, completion: @escaping (DataResponse<RemoveFromBasketResult>) -> Void) {
        let requestModel = RemoveFromBasketData(baseUrl: baseUrl, sessionId: sessionId, productId: productId)
        self.request(request: requestModel, completionHandler: completion)
    }
    
    func payOrderBy(sessionId: Int, paySumm: Int, completion: @escaping (DataResponse<PayOrderResult>) -> Void) {
        let requestModel = PayOrderData(baseUrl: mocUrl, sessionId: sessionId, paySumm: paySumm)
        self.request(request: requestModel, completionHandler: completion)
    }    
}
