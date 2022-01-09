//
//  ContentView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var setting : UserSettings
    
    var body: some View {
            
        if Storage.isLoggedIn {
            HotelsListView()
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



