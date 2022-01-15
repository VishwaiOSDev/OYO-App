//
//  Credientials.swift
//  OYO
//
//  Created by Vishwa  R on 09/01/22.
//

import Foundation

protocol AuthenticationService {
    mutating func performSignUp(for user : Authentication.User) -> Bool
    func performLogout() -> Bool
}

struct Authentication : AuthenticationService {
    
    @DecodeUserDefaults private(set) var users : [User]
    
    struct User : Codable {
        var name : String = ""
        var phone : String = ""
        var email : String = ""
        var password : String = ""
    }
    
    mutating func performSignUp(for user : User) -> Bool {
        let emailExists = checkAccountExists(for: users, with: user)
        if emailExists {
            print("This Email ID already Exists.")
            return false
        }
        print("This is the users list \(users)")
        users.append(user)
        Storage.loggedEmail = user.email
        return true
    }
    
    func performLogout() -> Bool {
        Storage.loggedEmail = ""
        return true
    }
    
    func checkAccountExists(for details : [User], with cred : User) -> Bool {
        return details.contains { data in
            data.email == cred.email
        }
    }
    
}

extension Authentication.User : Equatable {
    static func == (lhs: Authentication.User, rhs: Authentication.User) -> Bool {
        if lhs.email == rhs.email {
            return lhs.password == rhs.password
        }
        return false
    }
}



