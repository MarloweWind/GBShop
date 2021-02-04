//
//  Analytics.swift
//  GBShop
//
//  Created by Алексей Мальков on 02.02.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import Foundation
import YandexMobileMetrica

func analytics(state: String){
    
    YMMYandexMetrica.reportEvent("\(state) confirmed", onFailure: { (error) in
        print("DID FAIL REPORT EVENT: \(state)")
        print("REPORT ERROR: \(error.localizedDescription)")
        })
}
