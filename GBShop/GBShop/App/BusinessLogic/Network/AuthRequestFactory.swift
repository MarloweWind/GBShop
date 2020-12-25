//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (Alamofire.DataResponse<LoginResult>) -> Void)
    func logout(completionHandler: @escaping (DataResponse<LogoutResult>) -> Void)
}
