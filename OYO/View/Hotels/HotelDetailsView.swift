//
//  HotelDetailsView.swift
//  OYO
//
//  Created by Vishwa  R on 21/12/21.
//

import SwiftUI

struct HotelDetailsView: View {
    
    @State private var bookSheetPresented = false
    
    var hotel : User.Hotel = User.Hotel()
    
    var body: some View {
        VStack(alignment : .leading) {
            scrollView
                .padding(.horizontal, 8)
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
            .sheet(isPresented: $bookSheetPresented, content: {
                BookHotelView(hotelCost: hotel.hotelPrice, hotelName: hotel.hotelName)
            })
            .padding()
    }
    
    func bookButtonPressed() {
        bookSheetPresented.toggle()
    }
    
}

