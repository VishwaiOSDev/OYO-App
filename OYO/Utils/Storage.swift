//
//  Storage.swift
//  OYO
//
//  Created by Vishwa  R on 07/01/22.
//

import SwiftUI

struct Storage {
    
//    @AppStorage("isOwner") static var isOwner : Bool = false
    @AppStorage("login") static var isLoggedIn : Bool = false

    static func decodeData(for key : String) -> [String : String]? {
        
        let decorder = JSONDecoder()
        
        do {
            if let storedData = UserDefaults.standard.data(forKey: key) {
                let data = try decorder.decode([String : String].self, from: storedData)
                print(data)
                return data
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
        
    }
    
}
