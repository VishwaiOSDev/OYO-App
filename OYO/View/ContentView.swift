//
//  ContentView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var settings : AuthenticationViewModel
    
    var body: some View {
        
        if Storage.loggedIn {
            RootView()
        } else {
            LoginView()
        }
        
    }
}


struct OwnerView : View {
    
    @EnvironmentObject var settings : AuthenticationViewModel
    
    var body : some View {
        VStack{
            Text("Owner")
                .font(.largeTitle)
            Button("Log out") {
                settings.isLoggedIn = false
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



