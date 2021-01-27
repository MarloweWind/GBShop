//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Алексей Мальков on 22.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: SessionManager
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/mclaud2007/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: SessionManager,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility))
    {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func doChange(login: String, password: String, firstName: String, lastName: String?, email: String, completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = UserData(baseUrl: baseUrl, login: login, password: password, email: email, name: firstName, lastName: lastName ?? "")
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
