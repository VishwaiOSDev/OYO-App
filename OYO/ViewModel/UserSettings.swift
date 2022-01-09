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
    
    func loginValidation(credientials : Credientials) -> Bool {
        
        if credientials.password == "123" && credientials.email.contains("@") {
            return true
        }
        
        return false
        
    }
    
}
