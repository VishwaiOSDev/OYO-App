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
    @State private var isOwner : Bool = false
    
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        VStack(alignment : .leading) {
            Group {
                header
                Spacer()
                CustomTextField(text: $email, placeholder: "Email")
                    .keyboardType(.emailAddress)
                Text("\(viewModel.emailError)")
                    .font(.subheadline)
                    .foregroundColor(.red)
                CustomTextField(text: $name, placeholder: "Name")
                    .disableAutocorrection(true)
                Text("\(viewModel.nameError)")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            Group {
                CustomTextField(text: $phone, placeholder: "Phone")
                    .keyboardType(.numberPad)
                Text("\(viewModel.phoneError)")
                    .font(.subheadline)
                    .foregroundColor(.red)
                CustomSecureField(text: $password)
                ownerToggle
                Spacer()
                footer                
            }
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
    
    var ownerToggle : some View {
        Toggle(isOn: $isOwner) {
            Text("Are you owner of a hotel?")
        }
    }
    
    var footer : some View {
        PrimaryButton(action: storeUserDefault, label: "Sign Up")
    }
    
    func storeUserDefault() {
        let user = Authentication.User(name: name, phone: phone, email: email, password: password, isOwner: isOwner)
        viewModel.doSignUp(with: user)
    }
}


struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
