//
//  LoginResult.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User?
}
