//
//  CodableHotels.swift
//  OYO
//
//  Created by Vishwa  R on 17/01/22.
//

import Foundation

@propertyWrapper
struct CodableHotels {
    
    private var hotels : [Owner.Hotel] = [Owner.Hotel]()
    
    var wrappedValue : [Owner.Hotel] {
        get {
            return hotels
        }
        set {
            if let hotel = newValue.last {
                hotels.append(hotel)
                encodeHotels()
            }
        }
    }
    
    init() {
        if let hotelDetails = decodeHotels() {
            hotels = hotelDetails
        } else {
            hotels = []
        }
    }

}


extension CodableHotels {
    
    func encodeHotels() {
        var data : Data?
        let encoder = JSONEncoder()
        do {
            data = try encoder.encode(hotels)
        }
        catch {
            print(error.localizedDescription)
        }
        UserDefaults.standard.set(data, forKey: "hotels")
    }
    
    func decodeHotels() -> [Owner.Hotel]? {
        let decoder = JSONDecoder()
        do {
            if let storedData = UserDefaults.standard.data(forKey: "hotels") {
                let safeData = try decoder.decode([Owner.Hotel].self, from: storedData)
                return safeData
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
