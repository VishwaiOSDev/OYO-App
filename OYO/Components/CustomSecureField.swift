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
            .background(RoundedRectangle(cornerRadius: 10).fill(    Color(red: 0.113, green: 0.108, blue: 0.139)))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color(red: 0.201, green: 0.196, blue: 0.233))
            }
            .foregroundColor(.primary)
            .padding(.vertical, 4)
        
    }
    
}
