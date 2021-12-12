//
//  Product.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import Foundation

struct Product: Codable {
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
