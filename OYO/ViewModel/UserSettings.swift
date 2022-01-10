//
//  UserSettings.swift
//  OYO
//
//  Created by Vishwa  R on 09/01/22.
//

import Foundation
import SwiftUI


class UserSettings : ObservableObject {
    
    @Published var isLoggedIn : Bool {
        didSet {
            Storage.isLoggedIn = isLoggedIn
        }
    }
    
    init() {
        self.isLoggedIn = false
    }
    
    func loginValidation(for cred : Credientials) -> Bool {
        
        if let storedData = Storage.decodeData(for: "users") {
            
            if let storedPassword = storedData[cred.email] {
                if storedPassword == cred.password {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
    
}
