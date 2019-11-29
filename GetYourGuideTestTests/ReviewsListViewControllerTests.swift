//
//  ReviewsListViewControllerTests.swift
//  GetYourGuideTestTests
//
//  Created by Araib on 29/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import XCTest
@testable import GetYourGuideTest

class ReviewsListViewControllerTests: XCTestCase {
    
    private var viewController: ReviewListViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateInitialViewController() as? ReviewListViewController {
            viewController = vc
        }else {
            XCTFail("View could not be loaded")
            return
        }
        
        viewController.loadViewIfNeeded()
        viewController.viewDidLoad()
              
    }
    
    override func tearDown() {
        viewController =  nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
//table
extension ReviewsListViewControllerTests {
    
    func testHasTableView() {
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewController.tableView?.dataSource)
           XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:numberOfRowsInSection:))))
              XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:cellForRowAt:))))
        
    }
    
    func testTableViewHasDataSourcePrefetching() {
        XCTAssertNotNil(viewController.tableView?.prefetchDataSource)
    }
    
    
    
    
}

