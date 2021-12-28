//
//  Product.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import Foundation

struct Product: Codable {
    let result: Int
    let productID: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
}
