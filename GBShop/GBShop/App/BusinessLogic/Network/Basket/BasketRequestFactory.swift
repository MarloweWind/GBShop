//
//  BasketRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 14.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol BasketRequestFactory: AbstractRequestFactory {
    func getBasketBy(sessionId: Int, completion: @escaping (Alamofire.DataResponse<GetBasketResult>) -> Void)    
    func addProductToBasketBy(productId: Int, sessionId: Int, quantity: Int, completion: @escaping (Alamofire.DataResponse<AddToBasketResult>) -> Void)
    func removeProductFromBasketBy(productId: Int, sessionId: Int, completion: @escaping (Alamofire.DataResponse<RemoveFromBasketResult>) -> Void)
    func payOrderBy(sessionId: Int, paySumm: Int, completion: @escaping (Alamofire.DataResponse<PayOrderResult>) -> Void)
}
