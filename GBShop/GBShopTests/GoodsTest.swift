//
//  GoodsTest.swift
//  GBShopTests
//
//  Created by Алексей Мальков on 26.12.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

enum CatalogApiErrorStub: Error {
    case fatalError
}

struct CatalogErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return CatalogApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class GoodsTest: XCTestCase {

    let exectation = XCTestExpectation(description: "GoodsTests")
    let sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
    var goodsObject: Goods!
    var errorParser: CatalogErrorParserStub!
    var timeout: TimeInterval = 10.0
    
    override func setUp() {
        errorParser = CatalogErrorParserStub()
        goodsObject = Goods(errorParser: errorParser, sessionManager: sessionManager)
    }
    
    override func tearDown() {
        errorParser = nil
        goodsObject = nil
    }
    
    func testGoodsData(){
        goodsObject.doCatalogList() { [weak self] (response: DataResponse<CatalogArray>) in
            switch response.result {
            case .success(let productResult):
                if productResult.count == 0 {
                    XCTFail("No products return")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
        }
        
        wait(for: [exectation], timeout: timeout)
    }
    
    func testGoodsById(){
        goodsObject.doProduct() { [weak self] (response: DataResponse<ProductResult>) in
            switch response.result {
            case .success(let goodResult):
                if goodResult.productDescription.isEmpty {
                    XCTFail("No product description")
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
