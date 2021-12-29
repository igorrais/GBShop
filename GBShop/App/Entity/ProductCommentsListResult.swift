//
//  ProductCommentsListResult.swift
//  GBShop
//
//  Created by Igor Rais on 29.12.2021.
//

import Foundation

struct ProductCommentsListResult: Codable {
    let productID: Int
    let productCommentsList: [ProductComment]
    
}
