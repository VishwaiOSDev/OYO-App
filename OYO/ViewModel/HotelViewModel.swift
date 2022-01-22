//
//  UserViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 17/01/22.
//

import Foundation

final class HotelViewModel : ObservableObject {
    
    @Published var hotels = [User.Hotel]()
    
    private var model = User()
    
    func getListOfHotels() {
        hotels = model.getAllHotels()
    }
    
}
