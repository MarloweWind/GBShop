//
//  LoginResult.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    let authToken: String
}
