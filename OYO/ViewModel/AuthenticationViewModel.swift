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
    @Published var emailError : String = ""
    @Published var phoneError : String = ""
    @Published var nameError : String = ""
    
    private var model = Authentication()
    
    init() {
        self.isLoggedIn = false
        self.isOwner = false
    }
    
    func doSignUp(with details : Authentication.User) {
        do {
            try validateField(for: details)
            let isSignedUp = model.performSignUp(for: details)
            let userStatus = model.checkUserOrOwner(for: details)
            self.isOwner = userStatus
            self.isLoggedIn = isSignedUp
        }
        catch (let error as SignUpError) {
            switch error {
            case .tooShort:
                emailError = error.localizedDescription
            case .tooLong:
                emailError = error.localizedDescription
            case .notValidEmail:
                emailError = error.localizedDescription
            case .invalidCharacter(_):
                nameError = error.localizedDescription
            case .noValidPhone:
                phoneError = error.localizedDescription
            }
        }
        catch {
            print(error.localizedDescription)
        }
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

extension AuthenticationViewModel {
    func validateField(for user : Authentication.User) throws {
        guard user.email.count > 3 else {
            throw SignUpError.tooShort
        }
        guard user.email.count < 15 else {
            throw SignUpError.tooLong
        }
        guard user.email.contains("@") else {
            throw SignUpError.notValidEmail
        }
        guard user.phone.count == 10 else {
            throw SignUpError.noValidPhone
        }
        for character in user.name {
            guard character.isLetter else {
                throw SignUpError.invalidCharacter(character)
            }
        }
    }
}

