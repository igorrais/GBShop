//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userLogin: String, userPassword: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(userID: Int, completionHandler: @escaping (AFDataResponse<StandardResult>) -> Void)
}
