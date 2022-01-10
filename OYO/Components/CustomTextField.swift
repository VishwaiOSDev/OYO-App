//
//  CustomTextField.swift
//  OYO
//
//  Created by Vishwa  R on 10/01/22.
//

import SwiftUI

struct CustomTextField : View {
    
    @Binding var text : String
    let placeholder : String
    
    var body : some View {
        
        TextField(placeholder, text: $text)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("FieldBackground")))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("FieldBorder"))
            }
            .foregroundColor(.primary)
            .padding(.vertical, 4)
        
    }
    
}
