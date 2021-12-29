//
//  ProductsCommentsRequestFactory.swift
//  GBShop
//
//  Created by Igor Rais on 29.12.2021.
//

import Foundation
import Alamofire

protocol ProductsCommentsRequestFactory {
    func productCommentsList(productID: Int, completionHandler: @escaping (AFDataResponse<ProductCommentsListResult>) -> Void)
    func productCommentAdd(userName: String, userComment: String, completionHandler: @escaping (AFDataResponse<ProductComment>) -> Void)
    func productCommentDelete(commentID: Int, completionHandler: @escaping (AFDataResponse<StandardResult>) -> Void)
}
