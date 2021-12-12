//
//  RegistrationAndChangePersonalDataTests.swift
//  GBShopTests
//
//  Created by Igor Rais on 12.12.2021.
//

import XCTest
import Alamofire
@testable import GBShop

struct RegistrationUserResultStub: Codable {
    let result: Int
    let userMessage: String
}

struct ChangePersonalDataResultStub: Codable {
    let result: Int
}

class RegistrationAndChangePersonalDataTests: XCTestCase {
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
    
    func testRegistrationRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/registerUser.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<RegistrationUserResultStub, AFError>) in
                switch response.result {
                case .success(_):
                    break
                case .failure: XCTFail()
                }
                self.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testChangePersonalDataRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/changeUserData.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<ChangePersonalDataResultStub, AFError>) in
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
