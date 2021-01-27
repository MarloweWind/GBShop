//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func doChange(login: String,
                  password: String,
                  firstName: String,
                  lastName: String?,
                  email: String,
                  completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) -> Void
}
