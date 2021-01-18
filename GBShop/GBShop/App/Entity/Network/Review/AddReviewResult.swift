//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 08.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userReview: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userReview = "userMessage"
    }
}
