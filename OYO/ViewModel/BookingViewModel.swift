//
//  BookingViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 18/01/22.
//

import Foundation

final class BookingViewModel : ObservableObject {
    
    @Published var bookedHotels = [Booking.Book]()
    
    private var model = Booking()
    
    func bookHotelFor(user : Booking.Book) {
        model.bookHotel(for: user)
    }
    
    func getTotalCost(from : Date, to : Date, costOfHotel : String) -> Int {
        let numberOfDays = getTotalNumberOfDays(fromDate: from, toDate: to)
        return numberOfDays * Int(costOfHotel)!
    }
    
    func getBookedHotelsOf(owner user : String) {
        if let hotels = model.getBookedHotelDetails(for: user) {
            bookedHotels = hotels
        } else {
            bookedHotels = []
        }
    }
    
    private func getTotalNumberOfDays(fromDate : Date, toDate : Date) -> Int {
        return Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day!
    }
}
