//
//  RequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let manager = SessionManager(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    let queue = DispatchQueue.main
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
    func makeRegisterRequestFactory() -> RegisterRequestFactory {
        let errorParser = makeErrorParser()
        return Register(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
    func makeGoodsRequestFactory() -> CatalogRequestFactory{
        let errorParser = makeErrorParser()
        return Goods(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory{
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
    func makeBasketFactory() -> BasketRequestFactory {
        let errorParser = makeErrorParser()
        return Basket(errorParser: errorParser, sessionManager: commonSessionManager, queue: queue)
    }
    
}
