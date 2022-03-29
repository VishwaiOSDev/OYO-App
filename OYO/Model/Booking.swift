//
//  Book.swift
//  OYO
//
//  Created by Vishwa  R on 18/01/22.
//

import Foundation

protocol Bookable {
    var id: UUID { get set }
    var hotelName: String { get set }
    var user: String { get set }
    var totalCost: Int { get set }
}

struct Booking  {
    
    @CodableUserDefaults private var users : [Authentication.User]
    @CodableHotels private var hotels : [User.Hotel]
    
    struct Book : Codable, Identifiable, Bookable {
        var id = UUID()
        var hotelName : String = ""
        var user : String = ""
        var totalCost : Int = 0
    }

    mutating func bookHotel(for user : Book) {
        guard let hotelDetail = hotels.first(where: { $0.hotelName == user.hotelName }) else { return }
        if let ownerMail = hotelDetail.owner {
            guard var owner = findDetailsOf(owner: ownerMail) else { return }
            owner.bookedDetails.append(user)
            users.append(owner)
        } else {
            print("There is no owner.")
        }
    }
    
    func getBookedHotelDetails(for user : String) -> [Booking.Book]? {
        guard let owner = users.first(where :{ $0.email == user }) else { return nil }
        return owner.bookedDetails
    }
    
    private func findDetailsOf(owner : String) -> Authentication.User?  {
        guard let owner = users.first(where : { $0.email == owner }) else { return nil }
        return owner
    }
    
}
