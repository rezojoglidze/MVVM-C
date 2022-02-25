//
//  MVVM_C_ProjectTests.swift
//  MVVM-C ProjectTests
//
//  Created by Rezo Joglidze on 23.02.22.
//

import XCTest
@testable import MVVM_C_Project

class MVVM_C_ProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordLoaded() {
        let array: [Int] = []
        XCTAssertEqual(array.count, 0, "AllWords must be 0")
    }
}
