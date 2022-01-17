//
//  HotelsViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import Foundation

class OwnerViewModel : ObservableObject {
        
    private var model = Owner()
    
    func doPostNewHotel(with detail : Owner.Hotel) -> Bool {
        let status = model.postNewHotel(for: detail)
        return status
    }

}
