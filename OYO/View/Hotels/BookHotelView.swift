//
//  BookHotelView.swift
//  OYO
//
//  Created by Vishwa  R on 17/01/22.
//

import SwiftUI

struct BookHotelView: View {
    
    @StateObject private var viewModel = BookingViewModel()
    @State private var fromDate = Date()
    @State private var toDate = Date()
    var hotelCost : String
    var hotelName : String
    private var totalCost : Int {
        get {
            viewModel.getTotalCost(from: fromDate, to: toDate, costOfHotel: hotelCost)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Booking Details")
                .font(.largeTitle)
                .bold()
            Spacer()
            DatePicker(selection: $fromDate, in : Date()... , displayedComponents: .date, label: { Text("Check In") })
            DatePicker(selection: $toDate, in : fromDate... , displayedComponents: .date, label: { Text("Check Out") })
            Text("Price: \(totalCost)")
                .font(.largeTitle)
            Spacer()
            PrimaryButton(action: bookButtonPressed, label: "Book")
        }
        .padding()
    }
    
    func bookButtonPressed() {
        let booking = Booking.Book(hotelName: hotelName, user: Storage.loggedEmail, totalCost: totalCost)
        viewModel.bookHotelFor(user: booking)
        
    }
    
    func datesBetween(start : Date, end : Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: toDate).day!
    }
    
}

struct BookHotelView_Previews: PreviewProvider {
    static var previews: some View {
        BookHotelView(hotelCost : "24", hotelName: "The Park")
    }
}
