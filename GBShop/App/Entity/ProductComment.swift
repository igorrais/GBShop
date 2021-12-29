//
//  ProductComment.swift
//  GBShop
//
//  Created by Igor Rais on 29.12.2021.
//

import Foundation

struct ProductComment: Codable {
    let commentID: Int
    let userName: String
    let userComment: String
    let userMessage: String
}
