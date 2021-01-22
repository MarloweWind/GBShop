//
//  ReviewRequestStruct.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

extension Review{
    struct AddReview: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "addReview.json"
        
        let userReviw: String
        var parameters: Parameters? {
            return [
                "userReviw": userReviw,
            ]
        }
    }
    
    struct ApproveReviw: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "approveReview.json"
        var parameters: Parameters? = nil
    }
    
    struct RemoveReview: RequestRouter{
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "removeReview.json"
        var parameters: Parameters? = nil
    }
}
