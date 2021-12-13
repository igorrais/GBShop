//
//  ProductList.swift
//  GBShop
//
//  Created by Igor Rais on 12.12.2021.
//

import Foundation

struct ProductList: Codable {
    let id: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price
    }
}
