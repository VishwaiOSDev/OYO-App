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
                    Label("Hotels", systemImage: "square.split.1x2")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
