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
    
    private(set) var users = [User]()
    
    struct User : Codable {
        var name : String = ""
        var phone : String = ""
        var email : String = ""
        var password : String = ""
    }
    
    mutating func performSignUp(for user : User) -> Bool {
                
        @DecodeUserDefaults var oldData : [Authentication.User]
        let emailExists = checkAccountExists(for: oldData, with: user)
        if emailExists {
            print("This Email ID already Exists.")
            return false
        }
        users = oldData
        users.append(user)
        storeDataOnStorage(for: user.email)
        
        return true
        
    }
    
    func performLogout() -> Bool {
        Storage.loggedEmail = ""
        return true
    }
    
    func storeDataOnStorage(for email : String) {
        
        var data : Data?
        
        let encoder = JSONEncoder()
        
        do {
            data = try encoder.encode(users)
        }
        catch {
            print(error.localizedDescription)
        }
        
        UserDefaults.standard.set(data, forKey: "users")
        Storage.loggedEmail = email
        
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



