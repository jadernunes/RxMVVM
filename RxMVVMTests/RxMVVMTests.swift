//
//  RxMVVMTests.swift
//  RxMVVMTests
//
//  Created by Jáder Borba Nunes on 28/02/18.
//  Copyright © 2018 jader. All rights reserved.
//

import XCTest
@testable import RxMVVM

let timeoutApi = 30.0

class RxMVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestRandomData(){
        let expec = self.expectation(description: #function)

        let controller = RNDController()
        controller.requestNewData { (model: RNDModel) in
            
            expec.fulfill()
            XCTAssertFalse(model.getTitle().value.isEmpty)
        }

        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
}

