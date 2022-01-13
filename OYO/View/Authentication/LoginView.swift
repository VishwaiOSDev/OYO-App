//
//  LoginView.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject var settings : AuthenticationViewModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment : .leading) {
                
                header
                
                Spacer()
                
                CustomTextField(text: $email, placeholder: "Phone, email or username")
                
                CustomSecureField(text: $password)
                
                Spacer()
                
                footer
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
    
    var footer : some View {
        VStack {
            
            HStack {
                
                Text("Don't have an account?")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.66))
                
                NavigationLink(destination: SignupView()) {
                    Text("Register")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.primary)
                
            }
            .padding()
            
            PrimaryButton(action: loginPressed, label: "Login")
            
        }
    }
    
    var header : some View {
        
        VStack(alignment : .leading) {
            Text("Let's sign you in.")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.vertical, 2)
            Text("Welcome back. \nYou've been missed.")
                .font(.title)
                .fontWeight(.regular)
        }
        
        
    }
    
    func loginPressed() {
        
//        settings.performLogin(for: User(email : email, password: password))
        
        
//        let validation = settings.loginValidation(for: Credientials(email: email, password: password))
//        if validation {
//            settings.isLoggedIn = true
//        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
        
    }
}

