//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Алексей Мальков on 25.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory: AbstractRequestFactory {
    func doCatalogList(completionHandler: @escaping (DataResponse<Catalog>) -> Void)
    func doProduct(completionHandler: @escaping (DataResponse<Product>) -> Void)
}

