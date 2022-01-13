//
//  DecodeUserDefaults.swift
//  OYO
//
//  Created by Vishwa  R on 13/01/22.
//

import Foundation

@propertyWrapper
struct DecodeUserDefaults {

    private var users = [Authentication.User]()

    var wrappedValue : [Authentication.User] {
        get {
            return users
        }
    }
    
    init() {
       
        if let usersDetails = decodeFromUserDefaults() {
            users = usersDetails
        } else {
            users = []
        }
       
    }

    func decodeFromUserDefaults() -> [Authentication.User]? {
        let decoder = JSONDecoder()
        
        do {
            if let storedData = UserDefaults.standard.data(forKey: "users") {
                let safeData = try decoder.decode([Authentication.User].self, from: storedData)
                return safeData
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return nil
    }

}
