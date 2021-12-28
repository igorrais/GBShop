//
//  User.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation

struct User: Codable {
    let userID: Int
    let userLogin: String
    let userName: String
    let userLastname: String
}
