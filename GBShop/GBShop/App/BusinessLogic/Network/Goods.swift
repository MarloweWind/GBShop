//
//  Goods.swift
//  GBShop
//
//  Created by Алексей Мальков on 25.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import  Alamofire

class Goods: AbstractRequestFactory{
    
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
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

extension Goods{
    struct goodsData: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "catalogData.json"
        var parameters: Parameters? = nil
    }
    
    struct goodsById: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "getGoodById.json"
        var parameters: Parameters? = nil
    }
}

extension Goods: CatalogRequestFactory{
    
    func doCatalogList(completionHandler: @escaping (DataResponse<Catalog>) -> Void) {
        let requestModel = goodsData(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func doProduct(completionHandler: @escaping (DataResponse<Product>) -> Void) {
        let requestModel = goodsById(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}
