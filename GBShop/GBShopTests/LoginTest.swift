//
//  LoginTest.swift
//  GBShopTests
//
//  Created by Алексей Мальков on 26.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

enum UsersApiErrorStub: Error {
    case fatalError
}

struct ErrorParseStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return UsersApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class LoginTest: XCTestCase {
    let exectation = XCTestExpectation(description: "UsersTests")
    var errorParser: ErrorParseStub!
    let sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
    var authObject: Auth!
    var registrObjetct: Register!
    var changeUserDataObject: ChangeUserData!
    var timeout: TimeInterval = 10.0

    override func setUp() {
        errorParser = ErrorParseStub()
        authObject = Auth.init(errorParser: errorParser, sessionManager: sessionManager)
    }
    
    override func tearDown() {
        authObject = nil
        errorParser = nil
    }

    func testLogin() {
        authObject.login(userName: "test", password: "12345") { [weak self] (response: DataResponse<LoginResult>) in
            switch response.result {
            case .success(let loginResult):
                if loginResult.authToken.isEmpty {
                   XCTFail("Autho token is empty")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
        }
        wait(for: [exectation], timeout: timeout)
    }
    
    func testLogout() {
        authObject.logout() { [weak self] (response: DataResponse<LogoutResult>) in
            switch response.result {
            case .success(let logoutResult):
                if logoutResult.result != 1 {
                    XCTFail("Unknown LogoutResult")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
        }
        wait(for: [exectation], timeout: timeout)
    }

}
