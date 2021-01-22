//
//  GoodsRequestStruct.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

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
