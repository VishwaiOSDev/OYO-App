//
//  UserSettings.swift
//  OYO
//
//  Created by Vishwa  R on 09/01/22.
//

import SwiftUI

final class AuthenticationViewModel : ObservableObject {
    
    @Published var isLoggedIn : Bool {
        didSet {
            Storage.loggedIn = isLoggedIn
        }
    }
    
    private var model = Authentication()
    
    init() {
        self.isLoggedIn = false
    }
    
    func doSignUp(with details : Authentication.User) {
        
        let isSignedUp = model.performSignUp(for: details)
        
        if isSignedUp {
                self.isLoggedIn = true
        }
        
    }
    
    func doLogout() {
        
        let didLogout = model.performLogout()
        
        if didLogout {
                self.isLoggedIn = false
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Login Operation is Performed in here
    
//    func performLogin(for cred : User) {
//
//        if let userDefaults = decodeFromUserDefaults() {
//
//            print(userDefaults)
//
//            for data in userDefaults {
//                if data == cred {
//
//                    Storage.loggedEmail = cred.email
//
//                    DispatchQueue.main.async {
//                        self.isLoggedIn = true
//                    }
//                }
//            }
//
//        } else {
//            print("You are not a valid user.")
//        }
//
//    }
//
//    //MARK: - Decodes data from UserDefaults
//
//
//
//    func decodeUser(of user : String) {
//
//        if let storedData = decodeFromUserDefaults() {
//            for data in storedData {
//                if data.email == user {
//                    userDetails = data
//                }
//            }
//        }
//    }
}
