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
            Storage.loggedIn = isLoggedIn
        }
    }
    
    private(set) var credArray = [Credientials]()
    
    init() {
        self.isLoggedIn = false
    }
    
    //MARK: - Signup Operation is performed in here
    
    func performSignUp(for cred : Credientials) {
        
        var data : Data?
        
        let encoder = JSONEncoder()
        
        if let oldData = decodeFromUserDefaults() {
            
            let emailExists = checkAccountExists(for: oldData, with: cred)
            
            if emailExists {
                print("This Email ID already Exists.")
                return
            }
            
            credArray = oldData
            
            credArray.append(cred)
            
            do {
                data = try encoder.encode(credArray)
            }
            catch {
                print(error.localizedDescription)
            }
            
            UserDefaults.standard.set(data, forKey: "users")
            Storage.loggedEmail = cred.email
            
            DispatchQueue.main.async {
                self.isLoggedIn = true
            }
            
        }
        
    }
    
    
    //MARK: - Check User is already exists or not?
    
    func checkAccountExists(for details : [Credientials], with cred : Credientials) -> Bool {
        return details.contains { data in
            data.email == cred.email
        }
    }
    
    //MARK: - Login Operation is Performed in here
    
    func performLogin(for cred : Credientials) {
        
        if let userDefaults = decodeFromUserDefaults() {
            
            print(userDefaults)
            
            for data in userDefaults {
                if data == cred {
                    
                    Storage.loggedEmail = cred.email
                    
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                    }
                }
            }
            
        } else {
            print("You are not a valid user.")
        }
        
    }
    
    //MARK: - Decodes data from UserDefaults
    
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
    
}
