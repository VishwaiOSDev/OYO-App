//
//  UserSettings.swift
//  OYO
//
//  Created by Vishwa  R on 09/01/22.
//

import Foundation
import SwiftUI


class UserSettings : ObservableObject {
    
    @Published var isLoggedIn : Bool {
        didSet {
            Storage.isLoggedIn = isLoggedIn
        }
    }
    
    private var credArray = [Credientials]()
    
    init() {
        self.isLoggedIn = false
    }
    
    func performSignUp(for cred : Credientials) {
        
        var data : Data?
        
        let encoder = JSONEncoder()
        
        if let oldData = decodeFromUserDefaults() {
            credArray = oldData
        }
        
        credArray.append(cred)
        
        do {
            data = try encoder.encode(credArray)
        }
        catch {
            print(error.localizedDescription)
        }
        
        UserDefaults.standard.set(data, forKey: "users")
        
        DispatchQueue.main.async {
            self.isLoggedIn = true
        }
        
    }
    
    func decodeFromUserDefaults() -> [Credientials]? {
                
        let decoder = JSONDecoder()
        
        do {
            if let storedData = UserDefaults.standard.data(forKey: "users") {
                let safeData = try decoder.decode([Credientials].self, from: storedData)
                return safeData
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
        
    }

    func performLogin(for cred : Credientials) {
        
        if let userDefaults = decodeFromUserDefaults() {
            
            for data in userDefaults {
                if data == cred {
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                    }
                }
            }
            
        } else {
            print("You are not a valid user.")
        }
        
    }
    
}
