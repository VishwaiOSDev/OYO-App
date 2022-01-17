//
//  ProfileViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 15/01/22.
//

import SwiftUI

final class ProfileViewModel : ObservableObject {
    
    @Published private(set) var loggedInUser = Authentication.User()
    
    @CodableUserDefaults private var users : [Authentication.User]
    
    private var model = Authentication()
    
    func getProfileDetails() {
        for user in users {
            if user.email == Storage.loggedEmail {
                loggedInUser = user
            }
        }
    }
    
}
