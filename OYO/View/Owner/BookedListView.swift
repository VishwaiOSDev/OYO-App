//
//  BookedListView.swift
//  OYO
//
//  Created by Vishwa  R on 18/01/22.
//

import SwiftUI

struct BookedListView: View {
    
    @StateObject var viewModel = BookingViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.bookedHotels) { hotel in
                VStack(alignment : .leading) {
                    Text("\(hotel.hotelName)")
                        .font(.body)
                    Text(hotel.user)
                        .font(.title2)
                    Text("₹\(hotel.totalCost)")
                        .font(.largeTitle)
                        .bold()
                }
            }
            .navigationTitle("Booked Hotels")
        }
        .onAppear {
            viewModel.getBookedHotelsOf(owner: Storage.loggedEmail)
        }
    }
}

struct BookedListView_Previews: PreviewProvider {
    static var previews: some View {
        BookedListView()
    }
}
