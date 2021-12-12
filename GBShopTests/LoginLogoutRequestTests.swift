//
//  LoginLogoutRequestTests.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import XCTest
import Alamofire
@testable import GBShop

struct LoginResultStub: Codable {
    let result: Int
    let user: User
}

struct LogoutResultStub: Codable {
    let result: Int
}

class LoginLogoutRequestTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download data")
    var errorParser: ErrorParserStub!
    
    
    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        errorParser = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<LoginResultStub, AFError>) in
                switch response.result {
                case .success(_):
                    break
                case .failure: XCTFail()
                }
                self.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLogoutRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/logout.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<LogoutResultStub, AFError>) in
                switch response.result {
                case .success(_):
                    break
                case .failure: XCTFail()
                }
                self.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
}
