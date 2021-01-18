//
//  RemoveReviewResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 08.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct RemoveReviewResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
}
