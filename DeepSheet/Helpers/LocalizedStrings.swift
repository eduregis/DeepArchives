//
//  LocalizedStrings.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 23/11/20.
//

import Foundation

class LocalizedStrings {
    
    static var language: String {
        return UserDefaults.standard.string(forKey: "Language")!
    }
    
    static var strAttribute : String {
        switch language {
        case "EN":
            return "STR"
        case "PT":
            return "FOR"
        default:
            return "STR"
        }
    }
    
}
