//
//  AppDelegate.swift
//  GBShop
//
//  Created by Igor Rais on 05.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userLogin: "Somebody", userPassword: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error)
            }
        }
        auth.logout(userID: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error)
            }
        }
        let registrationAndChange = requestFactory.makeRegistrationAndChangePersonalDataFactory()
        registrationAndChange.registration(userID: 123, userLogin: "Somebody", userPassword: "mypassword", userEmail: "some@some.ru", userGender: "m", userCreditCardNumber: "9872389-2424-234224-234", userBio:  "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error)
            }
        }
        registrationAndChange.changePersonalData(userID: 123, userLogin: "Somebody", userPassword: "mypassword", userEmail: "some@some.ru", userGender: "m", userCreditCardNumber: "9872389-2424-234224-234", userBio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let changePersonalData):
                print(changePersonalData)
            case .failure(let error):
                print(error)
            }
        }
        let products = requestFactory.makeProductsFactory()
        products.productList(pageNumber: 1, categoryID: 1) { response in
            switch response.result {
            case .success(let productList):
                print(productList)
            case .failure(let error):
                print(error)
            }
        }
        products.product(productID: 123) { response in
            switch response.result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error)
            }
        }
        let comments = requestFactory.makeProductsCommentsRequestFactory()
        comments.productCommentsList(productID: 123) { response in
            switch response.result {
            case .success(let productCommentsList):
                print(productCommentsList)
            case .failure(let error):
                print(error)
            }
        }
        comments.productCommentAdd(userName: "Bob", userComment: "+") { response in
            switch response.result {
            case .success(let productCommentsAdd):
                print(productCommentsAdd)
            case .failure(let error):
                print(error)
            }
        }
        comments.productCommentDelete(commentID: 3) { response in
            switch response.result {
            case .success(let productCommentsDelete):
                print(productCommentsDelete)
            case .failure(let error):
                print(error)
            }
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

