//
//  ProfileView.swift
//  OYO
//
//  Created by Vishwa  R on 11/01/22.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var setting : UserSettings

    var body: some View {
        VStack {
            Text("This is Profile View")
                .font(.largeTitle)
            Button("Logout") {
                DispatchQueue.main.async {
                    setting.isLoggedIn = false
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
