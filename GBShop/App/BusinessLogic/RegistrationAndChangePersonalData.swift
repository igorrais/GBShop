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
    func registration(idUser: Int, userName: String, password: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<RegistrationUserResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, idUser: idUser, userName: userName, password: password, userEmail: userEmail, userGender: userGender, userCreditCardNumber: userCreditCardNumber, userBio: userBio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func changePersonalData(idUser: Int, userName: String, password: String, userEmail: String, userGender: String, userCreditCardNumber: String, userBio: String, completionHandler: @escaping (AFDataResponse<ChangePersonalDataResult>) -> Void) {
        let requestModel = Changes(baseUrl: baseUrl, idUser: idUser, userName: userName, password: password, userEmail: userEmail, userGender: userGender, userCreditCardNumber: userCreditCardNumber, userBio: userBio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RegistrationAndChangePersonalData {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "register"
        let idUser: Int
        let userName: String
        let password: String
        let userEmail: String
        let userGender: String
        let userCreditCardNumber: String
        let userBio: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": userName,
                "password": password,
                "email": userEmail,
                "gender": userGender,
                "credit_card": userCreditCardNumber,
                "bio": userBio
            ]
        }
    }
}

extension RegistrationAndChangePersonalData {
    struct Changes: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
        let idUser: Int
        let userName: String
        let password: String
        let userEmail: String
        let userGender: String
        let userCreditCardNumber: String
        let userBio: String
        
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": userName,
                "password": password,
                "email": userEmail,
                "gender": userGender,
                "credit_card": userCreditCardNumber,
                "bio": userBio
            ]
        }
    }
}
