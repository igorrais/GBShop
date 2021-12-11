//
//  RequestFactory.swift
//  GBShop
//
//  Created by Igor Rais on 11.12.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationAndChangePersonalDataFactory() -> RegistrationAndChangePersonalDataFactory {
        let errorParser = makeErrorParser()
        return RegistrationAndChangePersonalData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
