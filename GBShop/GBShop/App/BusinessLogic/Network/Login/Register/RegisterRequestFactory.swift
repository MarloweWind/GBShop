//
//  RegisterRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory {
    func doRegister(login: String,
                  password: String,
                  firstName: String,
                  lastName: String?,
                  email: String,
                  completionHandler: @escaping (DataResponse<RegisterResult>) -> Void) -> Void
}
