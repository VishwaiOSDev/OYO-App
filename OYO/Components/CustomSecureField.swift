//
//  CustomSecureField.swift
//  OYO
//
//  Created by Vishwa  R on 10/01/22.
//

import SwiftUI

struct CustomSecureField : View {
    
    @Binding var text : String
    
    var body : some View {
        
        SecureField("Password", text: $text)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(    Color("FieldBackground")))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("FieldBorder"))
            }
            .foregroundColor(.primary)
            .padding(.vertical, 4)
        
    }
    
}
