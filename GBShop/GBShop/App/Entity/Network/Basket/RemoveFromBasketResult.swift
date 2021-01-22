//
//  RemoveFromBasketResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 14.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation

struct RemoveFromBasketResult: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
}
