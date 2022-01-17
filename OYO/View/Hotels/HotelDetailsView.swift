//
//  HotelDetailsView.swift
//  OYO
//
//  Created by Vishwa  R on 21/12/21.
//

import SwiftUI

struct HotelDetailsView: View {
    
    var hotel : Owner.Hotel = Owner.Hotel()
    
    var body: some View {
        VStack {
            scrollView
            Spacer()
            bookButton
        }
        .navigationViewStyle(.stack)
        .navigationTitle(hotel.hotelName)
    }
    
    var scrollView : some View {
        ScrollView {
            details
        }
    }
    
    var details : some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(hotel.hotelDescription)
                .font(.body)
            Text("₹\(hotel.hotelPrice)/ day")
                .font(.largeTitle)
                .bold()
        }
    }
    
    var bookButton : some View {
        PrimaryButton(action: bookButtonPressed, label: "Book Now")
            .padding()
    }
    
    func bookButtonPressed() {
        print("Book Now button is Pressed.")
    }
    
}

