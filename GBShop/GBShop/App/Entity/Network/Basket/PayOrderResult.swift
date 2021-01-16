//
//  PayOrderResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 14.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct PayOrderResult: Codable {
    let result: Int
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case message = "message"
    }
}
