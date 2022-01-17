//
//  UserViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 17/01/22.
//

import Foundation

final class UserViewModel : ObservableObject {
    
    @Published var hotels = [Owner.Hotel]()
    
    private var model = Owner()
    
    func getListOfHotels() {
        hotels = model.getAllHotels()
    }
    
}
