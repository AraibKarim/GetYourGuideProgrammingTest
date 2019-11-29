//
//  GetYourGuideTestTests.swift
//  GetYourGuideTestTests
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import XCTest
@testable import GetYourGuideTest

class GetYourGuideTestTests: XCTestCase {
    
    var sut : GetReviewsClient!
    override func setUp() {
        sut = GetReviewsClient ()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut =  nil
    }
    
    func testGettingJSON() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        sut.fetchReviews(with: GetReviewsRequest.build(), limit: 10, offset: 0, completion: {  result in
            if case .success(let data) = result {
                XCTAssertNotNil(data)
            }
            if case .failure(let data) = result {
                XCTAssertNil(data)
            }
            XCTAssertNotNil(result)
            ex.fulfill()
            
        })
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
