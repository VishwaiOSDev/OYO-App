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
    
    func doLogin(for user : Authentication.User) {
        let isLoggedIn = model.performLogin(for: user)
        if isLoggedIn {
            self.isLoggedIn = true
        }
    }
    
    func doLogout() {
        let didLogout = model.performLogout()
        if didLogout {
                self.isLoggedIn = false
        }
    }
        
}
