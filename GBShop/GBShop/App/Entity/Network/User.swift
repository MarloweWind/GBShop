//
//  User.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation

struct User: Codable {
    let idUser: Int
    let userLogin: String
    let userName: String
    let userLastname: String

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case userLogin = "user_login"
        case userName = "user_name"
        case userLastname = "user_lastname"
    }
}
