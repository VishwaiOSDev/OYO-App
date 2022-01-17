//
//  Storage.swift
//  OYO
//
//  Created by Vishwa  R on 11/01/22.
//

import SwiftUI

struct Storage {
    
    @AppStorage("loggedIn") static var loggedIn = false
    @AppStorage("email") static var loggedEmail = ""
    @AppStorage("owner") static var owner = false
    
}
