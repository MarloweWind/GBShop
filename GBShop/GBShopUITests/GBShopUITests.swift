//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Алексей Мальков on 19.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import XCTest

class GBShopUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {

        continueAfterFailure = false
                
        app.launchArguments.append("myOption")
        
        app.launch()

    }

    private func enterAccessibleAuthData(login: String, password: String) {

        let loginTextField = app.textFields["login"]
        let passwordTextField = app.textFields["password"]

        loginTextField.tap()
        loginTextField.typeText(login)
        passwordTextField.tap()
        passwordTextField.typeText(password)

        let button = app.buttons["LoginButton"];
        button.tap()
    }
    
    func testAccessibleSuccess() throws {
        enterAccessibleAuthData(login: "admin", password: "admin")

        XCTAssert(app.navigationBars["mainmenu"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
