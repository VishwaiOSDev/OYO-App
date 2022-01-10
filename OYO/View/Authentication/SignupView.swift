//
//  SignupView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject var settings : UserSettings
    
    var body: some View {
        VStack(alignment : .leading) {
            
            header
            
            Spacer()
            
            CustomTextField(text: $email, placeholder: "Phone or email")
                .keyboardType(.emailAddress)
            
            CustomSecureField(text: $password)
            
            toggle
            
            Spacer()
            
            footer
            
        }
        .padding()
        .disableAutocorrection(true)
        
    }
    
    var toggle : some View {
        Toggle(isOn: Storage.$isOwner) {
            Text("Are you owner of a hotel?")
        }
        .padding(.vertical)
        .toggleStyle(.switch)
    }
    
    var header : some View {
        VStack(alignment : .leading) {
            Text("Let's sign up.")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.vertical, 2)
            Text("Welcome to Bookz. \nWe missed you.")
                .font(.title)
                .fontWeight(.regular)
        }
    }
    
    var footer : some View {
        
        NavigationLink(destination: HotelsListView().navigationBarHidden(true)) {
            PrimaryButton(action: storeUserDefault, label: "Sign Up")
        }
    }
    
    func storeUserDefault() {
        
        DispatchQueue.main.async {
            Storage.emailStorage = email
            Storage.passwordStorage = password
            settings.isLoggedIn = true
        }
        
    }
}


struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .preferredColorScheme(.dark)
        
    }
}
