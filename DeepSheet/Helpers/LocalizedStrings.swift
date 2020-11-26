//
//  LocalizedStrings.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 23/11/20.
//

import Foundation

class LocalizedStrings {
	
    static var language: String {
		UserDefaults.standard.setValue("PT", forKey: "Language")
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
	
	// MARK: - Strings for States View
	static var statesTitle: String {
		
		switch language {
		case "EN":
			return "States"
		case "PT":
			return "Estados"
		default:
			return "States"
		}
	}
	
	static var tempInsLabel: String {
		
		switch language {
		case "EN":
			return "Temporarily Insane"
		case "PT":
			return "Temporariamente Insano"
		default:
			return "Temporarily Insane"
		}
	}
	
	static var indefInsLabel: String {
		
		switch language {
		case "EN":
			return "Indefinitely Insane"
		case "PT":
			return "Indefinidamente Insano"
		default:
			return "Indefinitely Insane"
		}
	}
	
	static var incapacLabel: String {
		
		switch language {
		case "EN":
			return "Incapacitated"
		case "PT":
			return "Incapacitado"
		default:
			return "Incapacitated"
		}
	}
	
	static var woundLabel: String {
		
		switch language {
		case "EN":
			return "Gravely Wounded"
		case "PT":
			return "Gravemente Ferido"
		default:
			return "Gravely Wounded"
		}
	}
	
	// MARK: - Strings for Points View
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
