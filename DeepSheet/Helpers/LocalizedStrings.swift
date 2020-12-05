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
	
	static var luckRoll: String {
		
		switch language {
		case "EN":
			return "Luck (Points)"
		case "PT":
			return "Sorte (Pontos)"
		default:
			return "Luck (Points)"
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
	
	static var sanityRoll: String {
		
		switch language {
		case "EN":
			return "Sanity (Points)"
		case "PT":
			return "Sanidade (Pontos)"
		default:
			return "Sanity (Points)"
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
    
    // MARK: - Strings for Characteristic
	
	static var characteristicsTitle: String {
		switch language {
		case "EN":
			return "Attributes"
		case "PT":
			return "Atributos"
		default:
			return "Attributes"
		}
	}
    
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
            return "Constituição (Atributo)"
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
    
    // MARK: - Strings for Header Buttons
    
    static var investigators: String {
        switch language {
        case "EN":
            return "Investigators"
        case "PT":
            return "Investigadores"
        default:
            return "Investigators"
        }
    }
    
    static var editButton: String {
        switch language {
        case "EN":
            return "Edit"
        case "PT":
            return "Editar"
        default:
            return "Edit"
        }
    }
    
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
    
    // MARK: - Strings for Modals
    
    static var editProfileName: String {
        switch language {
        case "EN":
            return "Edit Profile"
        case "PT":
            return "Editar Perfil"
        default:
            return "Edit Profile"
        }
    }
    
    static var investigatorName: String {
        switch language {
        case "EN":
            return "Investigator Name"
        case "PT":
            return "Nome do Investigador"
        default:
            return "Investigator Name"
        }
    }
    
    static var playerName: String {
        switch language {
        case "EN":
            return "Player Name"
        case "PT":
            return "Nome do Jogador"
        default:
            return "Player Name"
        }
    }
    
    static var ocupation: String {
        switch language {
        case "EN":
            return "Ocupation"
        case "PT":
            return "Ocupação"
        default:
            return "Ocupation"
        }
    }
    
    static var age: String {
        switch language {
        case "EN":
            return "Age"
        case "PT":
            return "Idade"
        default:
            return "Age"
        }
    }
    
    static var gender: String {
        switch language {
        case "EN":
            return "Gender"
        case "PT":
            return "Gênero"
        default:
            return "Gender"
        }
    }
    
    static var address: String {
        switch language {
        case "EN":
            return "Address"
        case "PT":
            return "Onde Mora"
        default:
            return "Address"
        }
    }
    
    static var birthPlace: String {
        switch language {
        case "EN":
            return "Birth place"
        case "PT":
            return "Terra natal"
        default:
            return "Birth place"
        }
    }
    
    static var editCombatName: String {
        switch language {
        case "EN":
            return "Edit Combat"
        case "PT":
            return "Editar Combate"
        default:
            return "Edit Combat"
        }
    }
    
    static var damage: String {
        switch language {
        case "EN":
            return "Damage"
        case "PT":
            return "Dano"
        default:
            return "Damage"
        }
    }
    
    static var damageDetail: String {
        switch language {
        case "EN":
            return "Enter a valid combination of dices. Ex: 1d6 + 1d3, 1d4"
        case "PT":
            return "Insira uma combinação válida de dados. Ex: 1d6 + 1d3, 1d4"
        default:
            return "Enter a valid combination of dices. Ex: 1d6 + 1d3, 1d4"
        }
    }
    
    static var dodge: String {
        switch language {
        case "EN":
            return "Dodge"
        case "PT":
            return "Esquiva"
        default:
            return "Dodge"
        }
    }
    
    static var newItemName: String {
        switch language {
        case "EN":
            return "New Item"
        case "PT":
            return "Novo Item"
        default:
            return "New Item"
        }
    }
    
    static var itemName: String {
        switch language {
        case "EN":
            return "Item name"
        case "PT":
            return "Nome do item"
        default:
            return "Item name"
        }
    }
    
    static var uses: String {
        switch language {
        case "EN":
            return "Uses"
        case "PT":
            return "Usos"
        default:
            return "Uses"
        }
    }
    
    static var description: String {
        switch language {
        case "EN":
            return "Description"
        case "PT":
            return "Descrição"
        default:
            return "Description"
        }
    }
    
    static var editItemName: String {
        switch language {
        case "EN":
            return "Edit Item"
        case "PT":
            return "Editar Item"
        default:
            return "Edit Item"
        }
    }
    
    static var newWeaponName: String {
        switch language {
        case "EN":
            return "New Weapon"
        case "PT":
            return "Novo Golpe"
        default:
            return "New Weapon"
        }
    }
    
    static var points: String {
        switch language {
        case "EN":
            return "Points"
        case "PT":
            return "Pontos"
        default:
            return "Points"
        }
    }
    
    static var malfunction: String {
        switch language {
        case "EN":
            return "Malfunction (in %)"
        case "PT":
            return "Malfuncionamento (em %)"
        default:
            return "Malfunction (in %)"
        }
    }
    
    static var range: String {
        switch language {
        case "EN":
            return "Range (in meters)"
        case "PT":
            return "Alcance (em metros)"
        default:
            return "Range (in meters)"
        }
    }
    
    static var ammo: String {
        switch language {
        case "EN":
            return "Ammo"
        case "PT":
            return "Munição"
        default:
            return "Ammo"
        }
    }
    
    static var attacks: String {
        switch language {
        case "EN":
            return "Attacks"
        case "PT":
            return "Ataques"
        default:
            return "Attacks"
        }
    }
    
    static var editWeaponName: String {
        switch language {
        case "EN":
            return "Edit Weapon"
        case "PT":
            return "Editar Golpe"
        default:
            return "Edit Weapon"
        }
    }
    
    static var newSkillName: String {
        switch language {
        case "EN":
            return "New Skill"
        case "PT":
            return "Nova Perícia"
        default:
            return "New Skill"
        }
    }
    
    static var skillName: String {
        switch language {
        case "EN":
            return "Skill Name"
        case "PT":
            return "Nome da Perícia"
        default:
            return "Skill Name"
        }
    }
    
    static var value: String {
        switch language {
        case "EN":
            return "Value"
        case "PT":
            return "Valor"
        default:
            return "Value"
        }
    }
    
    static var editHistoric: String {
        switch language {
        case "EN":
            return "Edit Historic"
        case "PT":
            return "Editar Histórico"
        default:
            return "Edit Historic"
        }
    }
    
    static var personalDescription: String {
        switch language {
        case "EN":
            return "Personal Description"
        case "PT":
            return "Descrição Pessoal"
        default:
            return "Personal Description"
        }
    }
    
    static var ideology: String {
        switch language {
        case "EN":
            return "Ideology"
        case "PT":
            return "Ideologia"
        default:
            return "Ideology"
        }
    }
    
    static var traits: String {
        switch language {
        case "EN":
            return "Traits"
        case "PT":
            return "Traços"
        default:
            return "Traits"
        }
    }
    
    static var woundsAndScars: String {
        switch language {
        case "EN":
            return "Wounds and Scars"
        case "PT":
            return "Ferimentos e Cicatrizes"
        default:
            return "Wounds and Scars"
        }
    }
    
    static var phobiasAndManias: String {
        switch language {
        case "EN":
            return "Phobias and Manias"
        case "PT":
            return "Fobias and Manias"
        default:
            return "Phobias and Manias"
        }
    }
    
    static var importantPersons: String {
        switch language {
        case "EN":
            return "Important Persons"
        case "PT":
            return "Pessoas Importantes"
        default:
            return "Important Persons"
        }
    }
    
    static var importantLocals: String {
        switch language {
        case "EN":
            return "Important Locals"
        case "PT":
            return "Locais Importantes"
        default:
            return "Important Locals"
        }
    }
    
    static var possessions: String {
        switch language {
        case "EN":
            return "Possessions"
        case "PT":
            return "Posses"
        default:
            return "Possessions"
        }
    }
    
    static var tomesAndSpells: String {
        switch language {
        case "EN":
            return "Tomes and Spells"
        case "PT":
            return "Tomos, Feitiços e Magias"
        default:
            return "Tomes and Spells"
        }
    }
    
    static var meetingWithEntities: String {
        switch language {
        case "EN":
            return "Meeting with Entities"
        case "PT":
            return "Encontro com Entidades"
        default:
            return "Meeting with Entities"
        }
    }
    
    static var newInvestigatorName: String {
        switch language {
        case "EN":
            return "New investigator"
        case "PT":
            return "Novo Investigador"
        default:
            return "New investigator"
        }
    }
    
    static var addInvestigator: String {
        switch language {
        case "EN":
            return "Add\nInvestigator"
        case "PT":
            return "Adicionar\nInvestigador"
        default:
            return "Add\nInvestigator"
        }
    }
    
    static var editSkillName: String {
        switch language {
        case "EN":
            return "Edit Skill"
        case "PT":
            return "Editar Perícia"
        default:
            return "Edit Skill"
        }
    }
    
    static var category: String {
        switch language {
        case "EN":
            return "Category"
        case "PT":
            return "Categoria"
        default:
            return "Category"
        }
    }
    
    static var isActivatedSkill: String {
        switch language {
        case "EN":
            return "Skill active"
        case "PT":
            return "Perícia ativa"
        default:
            return "Skill active"
        }
    }
}
