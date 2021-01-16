//
//  AppDelegate.swift
//  GBShop
//
//  Created by Алексей Мальков on 19.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFactory()
        
        auth.login(userName: "admin", password: "admin") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        auth.logout { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let register = requestFactory.makeRegisterRequestFactory()
        
        register.doRegister(login: "marlowewind", password: "123456", firstName: "Alexey", lastName: "Malkov", email: "marlowe.wind@gmail.com") { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let change = requestFactory.makeChangeUserDataRequestFactory()
        
        change.doChange(login: "marlowewind", password: "654321", firstName: "Alexey", lastName: "Malkov", email: "marlowe.wind@gmail.com") { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let goods = requestFactory.makeGoodsRequestFactory()
        
        goods.doCatalogList(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        goods.doProduct(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let review = requestFactory.makeReviewRequestFactory()
        
        review.doAddReview(userReview: "Хорошая техника"){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        review.doApproveReview(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        review.doRemoveReview(){ response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let basket = requestFactory.makeBasketFactory()
        
        basket.getBasketBy(sessionId: 123) { response in
            print("Basket")
            
            switch response.result {
            case .success(let basketResult):
                print(basketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        basket.addProductToBasketBy(productId: 123, sessionId: 123, quantity: 2) { response in
            print("Add to basket")
            
            switch response.result {
            case .success(let addToBasketResult):
                print(addToBasketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        basket.removeProductFromBasketBy(productId: 123, sessionId: 123) { response in
            print("Remove from basket")

            switch response.result {
            case .success(let removeFromBasketResult):
                print(removeFromBasketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        basket.payOrderBy(sessionId: 123, paySumm: 2000) { response in
            print("Pay basket")
            
            switch response.result {
            case .success(let payBasketResult):
                print(payBasketResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

