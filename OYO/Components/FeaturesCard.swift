//
//  FeaturesCard.swift
//  OYO
//
//  Created by Vishwa  R on 21/12/21.
//

import SwiftUI

struct FeaturesCard: View {
    
    let iconName : String
    let iconDesciption : String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(lineWidth: 1.2)
            VStack{
                Image(systemName: iconName)
                    .font(.title)
                Text(iconDesciption)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding(.top, 4.0)
            }.foregroundColor(.primary)
            
        }
        .frame(width: 100, height: 100, alignment: .center)
        .foregroundColor(.gray)
    }
}

struct FeaturesCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesCard(iconName: "wifi", iconDesciption: "Wifi")
    }
}
