//
//  ProductsRequest.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import Foundation
import Alamofire

class ProductsRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://glacial-chamber-72083.herokuapp.com")!
    //let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init (errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductsRequest:  ProductsRequestFactory {
    func productList(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void) {
        let requestModel = ProductListRequest(baseUrl: baseUrl, pageNumber: pageNumber, categoryID: categoryID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func product(productID: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void) {
        let requestModel = ProductRequest(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductsRequest {
    struct ProductListRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalogData"
        let pageNumber: Int
        let categoryID: Int
        
        var parameters: Parameters? {
            return [
                "pageNumber": pageNumber,
                "categoryID": categoryID,
            ]
        }
    }
}

extension ProductsRequest {
    struct ProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodById"
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID,
            ]
        }
    }
}
