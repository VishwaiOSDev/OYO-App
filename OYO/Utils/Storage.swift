//
//  Storage.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct Storage {
    
    @AppStorage("email") static var emailStorage : String = ""
    @AppStorage("password") static var passwordStorage : String = ""
    @AppStorage("isOwner") static var isOwner : Bool = false
    @AppStorage("login") static var isLoggedIn : Bool = false
    
}
