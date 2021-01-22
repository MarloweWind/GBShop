//
//  RegisterRequestStruct.swift
//  GBShop
//
//  Created by Алексей Мальков on 18.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

extension Register {
    struct UserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let login: String
        let password: String
        let email: String
        let name: String
        let lastName: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password,
                "first_name": name,
                "last_name": lastName,
                "email": email
            ]
        }
    }
}
