//
//  RootView.swift
//  OYO
//
//  Created by Vishwa  R on 11/01/22.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        TabView {
            
            HotelsListView()
                .tabItem {
                    Image(systemName: "square.split.1x2")
                    Text("Hotels")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
        }
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
