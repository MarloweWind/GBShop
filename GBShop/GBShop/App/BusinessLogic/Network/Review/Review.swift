//
//  Review.swift
//  GBShop
//
//  Created by Алексей Мальков on 08.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory{
    
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

extension Review: ReviewRequestFactory{
    func doAddReview(userReview: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, userReviw: userReview)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func doApproveReview(completionHandler: @escaping (DataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = ApproveReviw(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func doRemoveReview(completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
