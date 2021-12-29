//
//  ProductsRequestFactory.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import Foundation
import Alamofire

protocol ProductsRequestFactory {
    func productList(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void)
    func product(productID: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
