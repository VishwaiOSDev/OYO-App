//
//  HotelsViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import Foundation

class OwnerViewModel : ObservableObject {
        
    private var model = User()
    
    func doPostNewHotel(with detail : User.Hotel) -> Bool {
        let status = model.postNewHotel(for: detail)
        return status
    }

}
