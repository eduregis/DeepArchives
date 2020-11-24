//
//  LocalizedStrings.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 23/11/20.
//

import Foundation

class LocalizedStrings {
	
    static var language: String {
		UserDefaults.standard.setValue("EN", forKey: "Language")
        return UserDefaults.standard.string(forKey: "Language")!
    }
    
    static var strAttribute: String {
        switch language {
        case "EN":
            return "STR"
        case "PT":
            return "FOR"
        default:
            return "STR"
        }
    }
	
	// MARK: - String for Points View
	static var pointsTitle: String {
		
		switch language {
		case "EN":
			return "Points"
		case "PT":
			return "Pontos"
		default:
			return "Points"
		}
	}
	
	static var luckPoints: String {
		
		switch language {
		case "EN":
			return "LUCK"
		case "PT":
			return "SORTE"
		default:
			return "LUCK"
		}
	}
	
	static var magicPoints: String {
		
		switch language {
		case "EN":
			return "MAGIC"
		case "PT":
			return "MAGIA"
		default:
			return "MAGIC"
		}
	}
	
	static var sanityPoints: String {
		
		switch language {
		case "EN":
			return "SANITY"
		case "PT":
			return "SANIDADE"
		default:
			return "SANITY"
		}
	}
	
	static var healthPoints: String {
		
		switch language {
		case "EN":
			return "HEALTH"
		case "PT":
			return "VIDA"
		default:
			return "HEALTH"
		}
	}
    
}
