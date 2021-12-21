//
//  HotelsViewModel.swift
//  OYO
//
//  Created by Vishwa  R on 20/12/21.
//

import Foundation

class HotelsViewModel : ObservableObject {
    
    @Published var hotels = [HotelData]()
    @Published var loading = false
    
    init() {
        fetchAllHotels()
    }
    
    func fetchAllHotels() {
        self.loading = true
        if let url = URL(string: "https://hotels.tikapp.ml/hotels") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let e = error {
                    print("Error is in shared dataTask \(e.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([HotelData].self, from: safeData)
                            DispatchQueue.main.async {
                                self.hotels = results
                                self.loading = false
                            }
                        }
                        catch {
                            print("Error is in decoding the data \(error.localizedDescription)")
                        }
                    }
                }
            }.resume()
        }
    }
}
