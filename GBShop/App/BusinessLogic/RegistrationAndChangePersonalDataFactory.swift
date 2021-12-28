//
//  RegistrationAndChangePersonalDataFactory.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation
import Alamofire

protocol RegistrationAndChangePersonalDataFactory {
    func registration(userID: Int, userLogin: String, userPassword: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<RegistrationUserResult>) -> Void)
    func changePersonalData(userID: Int, userLogin: String, userPassword: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<ChangePersonalDataResult>) -> Void)
}
