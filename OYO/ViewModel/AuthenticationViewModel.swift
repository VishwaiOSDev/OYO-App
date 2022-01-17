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
    @Published var isOwner : Bool {
        didSet {
            Storage.owner = isOwner
        }
    }
    
    private var model = Authentication()
    
    init() {
        self.isLoggedIn = false
        self.isOwner = false
    }
    
    func doSignUp(with details : Authentication.User) {
        let isSignedUp = model.performSignUp(for: details)
        let userStatus = model.checkUserOrOwner(for: details)
        self.isOwner = userStatus
        self.isLoggedIn = isSignedUp
    }
    
    func doLogin(for user : Authentication.User) {
        let isLoggedIn = model.performLogin(for: user)
        let userStatus = model.checkUserOrOwner(for: user)
        self.isOwner = userStatus
        self.isLoggedIn = isLoggedIn
    }
    
    func doLogout() {
        let didLogout = model.performLogout()
        self.isLoggedIn = !didLogout
        self.isOwner = !didLogout
    }
    
}
