//
//  CombatDelegate.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 26/11/20.
//

import Foundation

protocol CombatDelegate: NSObjectProtocol {
	
	func triggerDice(diceText: String, diceType: String)
	
	func triggerDamageDice(attackName: String, diceType: String)
	
}
