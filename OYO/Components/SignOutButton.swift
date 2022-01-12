//
//  SignOutButton.swift
//  OYO
//
//  Created by Vishwa  R on 12/01/22.
//

import SwiftUI

struct SignOutButton : View {
    
    var action : () -> Void
    var label : String
    
    var body : some View {
        
        Button(action: action) {
            Text(label)
                .frame(maxWidth : .infinity)
                .foregroundColor(.red)
                .padding()
                .background(Color("FieldBackground"))
                .cornerRadius(12)
        }

    }
    
}

