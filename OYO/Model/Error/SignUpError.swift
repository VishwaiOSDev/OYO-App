//
//  SignUpError.swift
//  OYO
//
//  Created by Vishwa  R on 19/01/22.
//

import Foundation

enum SignUpError : Error, LocalizedError {
    case tooShort
    case tooLong
    case notValidEmail
    case invalidCharacter(Character)
    case noValidPhone
    
    var errorDescription: String? {
        switch self {
        case .tooShort:
            return NSLocalizedString("Email needs to be at least 4 characters long",comment: "")
        case .tooLong:
            return NSLocalizedString("Email can't be longer than 14 characters", comment: "")
        case .notValidEmail:
            return NSLocalizedString("This is not a valid email address", comment: "")
        case .invalidCharacter(let character):
            return NSLocalizedString("Name can't contain \(character)", comment: "")
        case .noValidPhone:
            return NSLocalizedString("This is not a valid phone number", comment: "")
        }
    }
}
