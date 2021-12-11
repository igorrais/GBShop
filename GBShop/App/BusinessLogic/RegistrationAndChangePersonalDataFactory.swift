//
//  RegistrationAndChangePersonalDataFactory.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation
import Alamofire

protocol RegistrationAndChangePersonalDataFactory {
    func registration(idUser: Int, userName: String, password: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<RegistrationUserResult>) -> Void)
    func changePersonalData(idUser: Int, userName: String, password: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<ChangePersonalDataResult>) -> Void)
}
