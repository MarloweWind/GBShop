//
//  ReviewRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 08.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func doAddReview(userReview: String, completionHandler: @escaping (DataResponse<AddReviewResult>) -> Void)
    func doApproveReview(completionHandler: @escaping (DataResponse<ApproveReviewResult>) -> Void)
    func doRemoveReview(completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void)
}
