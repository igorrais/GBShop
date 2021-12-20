//
//  ProductListResult.swift
//  GBShop
//
//  Created by Igor Rais on 20.12.2021.
//

import Foundation

struct ProductListResult: Codable {
    let page_number: Int
    let product: ProductList?
}
