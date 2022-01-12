//
//  ProfileView.swift
//  OYO
//
//  Created by Vishwa  R on 11/01/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var setting : UserSettings
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Profile")
                .font(.largeTitle)
                .bold()
            
            ZStack {

                VStack {
                    
                    Text("V")
                        .font(.largeTitle)
                        .padding(25)
                        .background(.gray)
                        .clipShape(Circle())
                
                    HStack {
                        Text("Vishwa")
                            .font(.largeTitle)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                            .font(.title3)
                    }
                    
                    Text("vishwa300499@gmail.com")
                        .tint(.gray)
                    
                }
                .frame(maxWidth : .infinity)
                .padding()
                .background(Color("FieldBackground"))
                .cornerRadius(12)
                
            }
            
            HStack(spacing : 4) {
                
                VStack(alignment : .center) {
                    Text("Phone")
                        .font(.caption)
                    
                    Text("+91 95661 70360")
                }
                
                
            }
            .frame(maxWidth : .infinity)
            .padding()
            .background(Color("FieldBackground"))
            .cornerRadius(12)
            
            Spacer()
            
            Button {
                
            } label: {
                
                Text("Sign Out")
                    .frame(maxWidth : .infinity)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color("FieldBackground"))
                    .cornerRadius(12)
            }

            
            
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
