//
//  ContentView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var settings : UserSettings
    
    var body: some View {
        
        if Storage.isLoggedIn {
            HotelsListView()
        } else {
            LoginView()
        }
        
    }
}


struct OwnerView : View {
    
    @EnvironmentObject var settings : UserSettings
    
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



