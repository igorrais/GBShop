//
//  ProductsCommentsRequest.swift
//  GBShop
//
//  Created by Igor Rais on 29.12.2021.
//

import Foundation
import Alamofire


class ProductsCommentsRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://glacial-chamber-72083.herokuapp.com/")!
    //let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init (errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductsCommentsRequest:  ProductsCommentsRequestFactory {
    func productCommentsList(productID: Int, completionHandler: @escaping (AFDataResponse<ProductCommentsListResult>) -> Void) {
        let requestModel = ProductCommentsListRequest(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func productCommentAdd(userName: String, userComment: String, completionHandler: @escaping (AFDataResponse<ProductComment>) -> Void) {
        let requestModel = ProductCommentAddRequest(baseUrl: baseUrl, userName: userName, userComment: userComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func productCommentDelete(commentID: Int, completionHandler: @escaping (AFDataResponse<StandardResult>) -> Void) {
        let requestModel = ProductCommentDeleteRequest(baseUrl: baseUrl, commentID: commentID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension ProductsCommentsRequest {
    struct ProductCommentsListRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "productCommentsList"
        
        let productID: Int
        
        var parameters: Parameters? {
            return [
                "productID": productID
            ]
        }
    }
}

extension ProductsCommentsRequest {
    struct ProductCommentAddRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "productCommentAdd"
        
        let userName: String
        let userComment: String
        
        var parameters: Parameters? {
            return [
                "userName": userName,
                "userComment": userComment
            ]
        }
    }
}

extension ProductsCommentsRequest {
    struct ProductCommentDeleteRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "productCommentDelete"
        
        let commentID: Int
        
        var parameters: Parameters? {
            return [
                "commentID": commentID,
            ]
        }
    }
}
