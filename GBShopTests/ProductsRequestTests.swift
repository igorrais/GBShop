//
//  ProductsRequestTests.swift
//  GBShopTests
//
//  Created by Igor Rais on 12.12.2021.
//

import XCTest
import Alamofire
@testable import GBShop

struct ProductListStub: Codable {
    let id: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price
    }
}

struct ProductStub: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}

class ProductsRequestTests: XCTestCase {
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
    
    func testProductListRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<[ProductListStub], AFError>) in
                switch response.result {
                case .success(_):
                    break
                case .failure: XCTFail()
                }
                self.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testProductRequest() {
        let errorParser = ErrorParserStub()
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/getGoodById.json")
            .responseCodable(errorParser: errorParser) { (response: DataResponse<ProductStub, AFError>) in
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
