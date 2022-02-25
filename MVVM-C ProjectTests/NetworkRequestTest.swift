//
//  NetworkRequestTest.swift
//  MVVM-C ProjectTests
//
//  Created by Rezo Joglidze on 25.02.22.
//

import XCTest
@testable import MVVM_C_Project

class NetworkRequestTest: XCTestCase {

    var sut: URLSession!
    let networManager = NetworkManager.shared
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetTextsMethod() {
        //given
        guard let url = Constants.textsUrl else { return }
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        //when
        let dataTask = sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        //then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
