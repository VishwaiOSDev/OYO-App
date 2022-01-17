//
//  OwnerView.swift
//  OYO
//
//  Created by Vishwa  R on 17/01/22.
//

import SwiftUI

struct OwnerView: View {
    
    @EnvironmentObject var viewModel : OwnerViewModel
    @EnvironmentObject var authenticationViewModel : AuthenticationViewModel
    
    @State private var hotelName : String = ""
    @State private var hotelDescription : String = ""
    @State private var hotelPrice : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Hotel Name", text : $hotelName)
                    ZStack(alignment : .topLeading) {
                        if hotelDescription.isEmpty {
                            Text("Description")
                                .padding(8)
                                .font(.body)
                                .foregroundColor(.gray)
                            
                        }
                        TextEditor(text : $hotelDescription)
                            .frame(height : 150, alignment: .topLeading)
                            .lineLimit(5)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Section {
                        TextField("Price", text : $hotelPrice)
                    }
                }
                
                Spacer()
                
                PrimaryButton(action: postButtonPressed, label: "Post")
                    .padding()
            }
            .navigationTitle("Owner")
            .navigationViewStyle(.stack)
            .toolbar {
                Button("Log out") {
                    authenticationViewModel.doLogout()
                }
            }
        }
    }
    
    func postButtonPressed() {
        let hotel = Owner.Hotel(hotelName: hotelName, hotelDescription: hotelDescription, hotelPrice: hotelPrice)
        let isHotelPosted = viewModel.doPostNewHotel(with: hotel)
        if isHotelPosted {
            resetFields()
        }
    }
    
    func resetFields() {
        hotelName = ""
        hotelDescription = ""
        hotelPrice = ""
    }
    
}

struct OwnerView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerView()
    }
}
