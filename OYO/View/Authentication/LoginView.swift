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
    
    
    @EnvironmentObject var settings : UserSettings
    
    var body: some View {
        NavigationView {
            VStack(alignment : .leading) {
                header
                
                Spacer()
                
                TextField("Phone, email or username", text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(    Color(red: 0.113, green: 0.108, blue: 0.139)))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color(red: 0.201, green: 0.196, blue: 0.233))
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical, 4)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(    Color(red: 0.113, green: 0.108, blue: 0.139)))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color(red: 0.201, green: 0.196, blue: 0.233))
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical, 4)
                
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        Text("Don't have an account?")
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.66)/*@END_MENU_TOKEN@*/)
                        
                        NavigationLink(destination: SignupView()) {
                            Text("Register")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        
                    }
                    .padding()
                    
                    PrimaryButton(action: loginPressed, label: "Login")
                    
                }
                
                
            }
            .padding()
            .navigationViewStyle(StackNavigationViewStyle())
 
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
        let validation = settings.loginValidation(credientials: Credientials(email: email, password: password))
        if validation {
            settings.isLoggedIn = true
        }
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
        
    }
}


struct PrimaryButton: View {
    
    var action : () -> ()
    var label : String
    
    var body: some View {
        Button(action : action) {
            Text(label)
                .font(.title3)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth : .infinity, maxHeight: 50)
        }
        .padding(8)
        .background(.white)
        .cornerRadius(20)
    }
}
