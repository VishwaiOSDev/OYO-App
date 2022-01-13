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
    @State private var name : String = ""
    @State private var phone : String = ""
    
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        VStack(alignment : .leading) {
            
            header
            
            Spacer()
            
            CustomTextField(text: $email, placeholder: "Email")
                .keyboardType(.emailAddress)
            
            CustomTextField(text: $name, placeholder: "Name")
                .disableAutocorrection(true)
            
            CustomTextField(text: $phone, placeholder: "Phone")
                .keyboardType(.numberPad)
            
            CustomSecureField(text: $password)
                        
            Spacer()
            
            footer
            
        }
        .padding()
        .disableAutocorrection(true)
        .navigationTitle("Bookz")
        
    }
    
    
    var header : some View {
        VStack(alignment : .leading) {
            Text("Let's sign up.")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding(.vertical, 2)
          
        }
    }
    
    var footer : some View {
        
        PrimaryButton(action: storeUserDefault, label: "Sign Up")
    
    }
    
    func storeUserDefault() {
        let user = Authentication.User(name: name, phone: phone, email: email, password: password)
        viewModel.doSignUp(with: user)
    }
}


struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
