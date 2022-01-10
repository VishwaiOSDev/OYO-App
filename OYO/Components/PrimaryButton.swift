//
//  PrimaryButton.swift
//  OYO
//
//  Created by Vishwa  R on 10/01/22.
//

import SwiftUI

struct PrimaryButton : View {
    
    var action : () -> ()
    var label : String
    
    var body : some View {

        Button(action : action) {
            Text(label)
                .font(.title3)
                .bold()
                .foregroundColor(Color("B&W"))
                .frame(maxWidth : .infinity, maxHeight: 50)
        }
        .padding(8)
        .background(.primary)
        .cornerRadius(20)

    }
    
}
