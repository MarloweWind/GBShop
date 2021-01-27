//
//  ReviewTest.swift
//  GBShopTests
//
//  Created by Алексей Мальков on 08.01.2021.
//  Copyright © 2021 Alexey Malkov. All rights reserved.
//

import XCTest
import Alamofire
@testable import GBShop

enum ReviewApiErrorStub: Error {
    case fatalError
}

struct ReviewErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ReviewApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

class ReviewTest: XCTestCase {
    
    let exectation = XCTestExpectation(description: "GoodsTests")
    let sessionManager = SessionManager(configuration: URLSessionConfiguration.default)
    var reviewObject: Review!
    var errorParser: ReviewErrorParserStub!
    var timeout: TimeInterval = 10.0
    
    override func setUp() {
        errorParser = ReviewErrorParserStub()
        reviewObject = Review(errorParser: errorParser, sessionManager: sessionManager)
    }
    
    override func tearDown() {
        errorParser = nil
        reviewObject = nil
    }
    
    func testAddReview(){
        reviewObject.doAddReview(userReview: "test"){ [weak self] (response: DataResponse<AddReviewResult>) in
            switch response.result {
            case .success(let addReviewResult):
                if addReviewResult.result == 0 {
                   XCTFail("No review return")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
            }
        wait(for: [exectation], timeout: timeout)
    }
    
    func testApproveReview(){
        reviewObject.doApproveReview(){ [weak self] (response: DataResponse<ApproveReviewResult>) in
            switch response.result {
            case .success(let approveReviewResult):
                if approveReviewResult.result == 0 {
                   XCTFail("No review return")
                }
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            self?.exectation.fulfill()
            }
        wait(for: [exectation], timeout: timeout)
    }
    
    func testRemoveReview(){
        reviewObject.doRemoveReview(){ [weak self] (response: DataResponse<RemoveReviewResult>) in
            switch response.result {
            case .success(let removeReviewResult):
                if removeReviewResult.result == 0 {
                   XCTFail("No review return")
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
