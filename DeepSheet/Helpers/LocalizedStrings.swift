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
    
    static var dexAttribute: String {
        switch language {
        case "EN":
            return "DEX"
        case "PT":
            return "DES"
        default:
            return "DEX"
        }
    }
    
    static var intAttribute: String {
        switch language {
        case "EN":
            return "INT"
        case "PT":
            return "INT"
        default:
            return "INT"
        }
    }
    
    static var conAttribute: String {
        switch language {
        case "EN":
            return "CON"
        case "PT":
            return "CON"
        default:
            return "CON"
        }
    }
    
    static var appAttribute: String {
        switch language {
        case "EN":
            return "APP"
        case "PT":
            return "APA"
        default:
            return "APP"
        }
    }
    
    static var powAttribute: String {
        switch language {
        case "EN":
            return "POW"
        case "PT":
            return "POD"
        default:
            return "POW"
        }
    }
    
    static var sizAttribute: String {
        switch language {
        case "EN":
            return "SIZ"
        case "PT":
            return "TAM"
        default:
            return "SIZ"
        }
    }
    
    static var eduAttribute: String {
        switch language {
        case "EN":
            return "EDU"
        case "PT":
            return "EDU"
        default:
            return "EDU"
        }
    }
    
    static var movAttribute: String {
        switch language {
        case "EN":
            return "MOV"
        case "PT":
            return "MOV"
        default:
            return "MOV"
        }
    }
    
    // MARK: - Strings for Characteristic Buttons
    
    static var strAttributeText: String {
        switch language {
        case "EN":
            return "Strenght (Attribute)"
        case "PT":
            return "Força (Atributo)"
        default:
            return "Strenght (Attribute)"
        }
    }
    
    static var dexAttributeText: String {
        switch language {
        case "EN":
            return "Dexterity (Attribute)"
        case "PT":
            return "Destreza (Atributo)"
        default:
            return "Dexterity (Attribute)"
        }
    }
    
    static var intAttributeText: String {
        switch language {
        case "EN":
            return "Intelligence (Attribute)"
        case "PT":
            return "Inteligência (Atributo)"
        default:
            return "Intelligence (Attribute)"
        }
    }
    
    static var conAttributeText: String {
        switch language {
        case "EN":
            return "Constitution (Attribute)"
        case "PT":
            return "Constiutuição (Atributo)"
        default:
            return "Constitution (Attribute)"
        }
    }
    
    static var appAttributeText: String {
        switch language {
        case "EN":
            return "Appearance (Attribute)"
        case "PT":
            return "Aparência (Atributo)"
        default:
            return "Appearance (Attribute)"
        }
    }
    
    static var powAttributeText: String {
        switch language {
        case "EN":
            return "Power (Attribute)"
        case "PT":
            return "Poder (Atributo)"
        default:
            return "Power (Attribute)"
        }
    }
    
    static var sizAttributeText: String {
        switch language {
        case "EN":
            return "Size (Attribute)"
        case "PT":
            return "Tamanho (Atributo)"
        default:
            return "Size (Attribute)"
        }
    }
    
    static var eduAttributeText: String {
        switch language {
        case "EN":
            return "Education (Attribute)"
        case "PT":
            return "Educação (Atributo)"
        default:
            return "Education (Attribute)"
        }
    }
    
    static var movAttributeText: String {
        switch language {
        case "EN":
            return "Move (Attribute)"
        case "PT":
            return "Movimentação (Atributo)"
        default:
            return "Move (Attribute)"
        }
    }
    
    static var rollDiceD100: String {
        switch language {
        case "EN":
            return "Roll: d100"
        case "PT":
            return "Rolagem: d100"
        default:
            return "Roll: d100"
        }
    }
    
    // MARK: - Strings for Modals Texts and Buttons
    
    static var cancelButton: String {
        switch language {
        case "EN":
            return "Cancel"
        case "PT":
            return "Cancelar"
        default:
            return "Cancel"
        }
    }
    
    static var nextButton: String {
        switch language {
        case "EN":
            return "Next"
        case "PT":
            return "Próximo"
        default:
            return "Next"
        }
    }
    
    static var backButton: String {
        switch language {
        case "EN":
            return "Back"
        case "PT":
            return "Voltar"
        default:
            return "Back"
        }
    }
    
    static var confirmButton: String {
        switch language {
        case "EN":
            return "Confirm"
        case "PT":
            return "Confirmar"
        default:
            return "Confirm"
        }
    }
}

