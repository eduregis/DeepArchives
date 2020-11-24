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
    
    static var dexAttribute : String {
        switch language {
        case "EN":
            return "DEX"
        case "PT":
            return "DES"
        default:
            return "DEX"
        }
    }
    
    static var intAttribute : String {
        switch language {
        case "EN":
            return "INT"
        case "PT":
            return "INT"
        default:
            return "INT"
        }
    }
    
    static var conAttribute : String {
        switch language {
        case "EN":
            return "CON"
        case "PT":
            return "CON"
        default:
            return "CON"
        }
    }
    
    static var appAttribute : String {
        switch language {
        case "EN":
            return "APP"
        case "PT":
            return "APA"
        default:
            return "APP"
        }
    }
    
    static var powAttribute : String {
        switch language {
        case "EN":
            return "POW"
        case "PT":
            return "POD"
        default:
            return "POW"
        }
    }
    
    static var sizAttribute : String {
        switch language {
        case "EN":
            return "SIZ"
        case "PT":
            return "TAM"
        default:
            return "SIZ"
        }
    }
    
    static var eduAttribute : String {
        switch language {
        case "EN":
            return "EDU"
        case "PT":
            return "EDU"
        default:
            return "EDU"
        }
    }
    
    static var movAttribute : String {
        switch language {
        case "EN":
            return "MOV"
        case "PT":
            return "MOV"
        default:
            return "MOV"
        }
    }
}
