//
//  HotelData.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import Foundation

struct HotelData : Decodable, Identifiable {
    var id : Int
    var hotel_name : String
    var rating : Int
    var cost_per_day : Int
    var image : String
    var description : String
    var features : [Feature]
}

struct Feature : Codable, Identifiable {
    var id : Int
    var icon_name : String
    var icon_description : String
}
