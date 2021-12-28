//
//  RegistrationAndChangePersonalData.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation
import Alamofire

class RegistrationAndChangePersonalData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://glacial-chamber-72083.herokuapp.com/")!
    //let baseUrl = URL(string: "http://127.0.0.1:8080/")!
    
    init (errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension RegistrationAndChangePersonalData:  RegistrationAndChangePersonalDataFactory {
    func registration(userID: Int, userLogin: String, userPassword: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<RegistrationUserResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userID: userID, userLogin: userLogin, userPassword: userPassword, userEmail: userEmail, userGender: userGender, userCreditCardNumber: userCreditCardNumber, userBio: userBio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func changePersonalData(userID: Int, userLogin: String, userPassword: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<ChangePersonalDataResult>) -> Void) {
        let requestModel = Changes(baseUrl: baseUrl, userID: userID, userLogin: userLogin, userPassword: userPassword, userEmail: userEmail, userGender: userGender, userCreditCardNumber: userCreditCardNumber, userBio: userBio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RegistrationAndChangePersonalData {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        let userID: Int
        let userLogin: String
        let userPassword: String
        let userEmail: String
        let userGender: String
        let userCreditCardNumber: String
        let userBio: String
        
        var parameters: Parameters? {
            return [
                "userID": userID,
                "userLogin": userLogin,
                "userPassword": userPassword,
                "userEmail": userEmail,
                "userGender": userGender,
                "userCreditCardNumber": userCreditCardNumber,
                "userBio": userBio
            ]
        }
    }
}

extension RegistrationAndChangePersonalData {
    struct Changes: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
        let userID: Int
        let userLogin: String
        let userPassword: String
        let userEmail: String
        let userGender: String
        let userCreditCardNumber: String
        let userBio: String
        
        var parameters: Parameters? {
            return [
                "userID": userID,
                "userLogin": userLogin,
                "userPassword": userPassword,
                "userEmail": userEmail,
                "userGender": userGender,
                "userCreditCardNumber": userCreditCardNumber,
                "userBio": userBio
            ]
        }
    }
}
