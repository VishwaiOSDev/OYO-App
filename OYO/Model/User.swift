//
//  HotelData.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import Foundation

struct User {
    
    @CodableHotels private(set) var hotels : [Hotel]
    
    struct Hotel : Codable, Identifiable {
        var id = UUID()
        var hotelName : String
        var hotelDescription : String
        var hotelPrice : String
        var owner : String?
    }
        
    mutating func postNewHotel(for details : Hotel) -> Bool {
        hotels.append(details)
        return true
    }
    
    func getAllHotels() -> [User.Hotel] {
        return hotels
    }
    
}

extension User.Hotel {
    init(hotelName : String = "", hotelDescription : String = "", hotelPrice : String = "") {
        self.hotelName = hotelName
        self.hotelDescription = hotelDescription
        self.hotelPrice = hotelPrice
        if Storage.owner {
            owner = Storage.loggedEmail
        } else {
            owner = nil
        }
    }
}
