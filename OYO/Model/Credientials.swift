//
//  Credientials.swift
//  OYO
//
//  Created by Vishwa  R on 09/01/22.
//

import Foundation



struct Credientials : Codable, Equatable {
    
    var name : String = ""
    var phone : String = ""
    var email : String = ""
    var password : String = ""
    
    static func == (lhs: Credientials, rhs: Credientials) -> Bool {
        if lhs.email == rhs.email {
            if lhs.password == rhs.password {
                return true
            }
        }
        return false
    }

}
