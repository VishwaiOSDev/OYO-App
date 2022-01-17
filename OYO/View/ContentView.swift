//
//  ContentView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        
        if Storage.loggedIn {
            if Storage.owner {
                OwnerView()
                    .environmentObject(OwnerViewModel())
            } else {
                RootView()
                    .environmentObject(UserViewModel())
            }
        } else {
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



