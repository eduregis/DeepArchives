//
//  CombatPresenter.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 08/12/20.
//

import Foundation
import UIKit
import CoreData

class CombatPresenter {
	
	let dataContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	var generalCombat: [GeneralCombat] = []
	
	var items: [Item] = []
	
	var attacks: [Attack] = []
	
	let investigator: Investigator
	
	init(_ investigator: Investigator) {
		self.investigator = investigator
		items = fetchItems()
		attacks = fetchAttacks()
		
		if investigator.generalCombat == nil {
			//Remove once Presenter can access Stats Model
			let tempGeneral = GeneralCombat(context: self.dataContext)
			tempGeneral.damageBonus = "+1d8"
			tempGeneral.body = -1
			tempGeneral.dodgeValue = 75
			tempGeneral.investigator = self.investigator
			generalCombat = [tempGeneral]
		} else {
			generalCombat = fetchGeneralCombat()
		}
		
	}
	
	// MARK: - General Combat Logic
	
	func fetchGeneralCombat() -> [GeneralCombat] {
		
		let fetch = GeneralCombat.fetchRequest() as NSFetchRequest<GeneralCombat>
		let pred = NSPredicate(format: "investigator == %@", investigator)
		
		fetch.predicate = pred
		
		do {
			self.generalCombat = try dataContext.fetch(fetch)
		} catch {
			fatalError("Unable to FETCH GENERAL COMBAT DATA from core data model!")
		}
		
		return self.generalCombat
	}
	
	func editGeneralCombat(newDamage: String, newDodge: Int) {
	
		let newGeneral = GeneralCombat(context: self.dataContext)
		newGeneral.damageBonus = newDamage
		newGeneral.body = generalCombat[0].body
		newGeneral.dodgeValue = Int64(newDodge)
		newGeneral.investigator = investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE GENERAL COMBAT DATA to core data model!")
		}
		
		generalCombat = fetchGeneralCombat()
	}
	
	// MARK: - Attack Data Logic
	
	func newAttack(attackName: String, chance: Int, dice: String, reach: Int, num: Int, ammo: Int, malfunction: Int) {
		
		let newAttack = Attack(context: self.dataContext)
		newAttack.name = attackName
		newAttack.chance = Int64(chance)
		newAttack.dice = dice
		newAttack.reach = Int64(reach)
		newAttack.number = Int64(num)
		newAttack.ammo = Int64(ammo)
		newAttack.malfunction = Int64(malfunction)
		newAttack.investigator = self.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ATTACK DATA to core data model!")
		}
	}
	
	func updateAttack(for modAttack: Attack, newName: String, newChance: Int, newDice: String, newReach: Int, newNum: Int, newAmmo: Int, newMalfunction: Int) {
		
		let editAttack = modAttack
		editAttack.name = newName
		editAttack.chance = Int64(newChance)
		editAttack.dice = newDice
		editAttack.reach = Int64(newReach)
		editAttack.number = Int64(newNum)
		editAttack.ammo = Int64(newAmmo)
		editAttack.malfunction = Int64(newMalfunction)
		editAttack.investigator = self.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ATTACK DATA to core data model!")
		}
	}
	
	func updateAttackAmmo(for modAttack: Attack, with modAmmo: Int) {
		
		let editAttack = modAttack
		editAttack.name = modAttack.name
		editAttack.chance = modAttack.chance
		editAttack.dice = modAttack.dice
		editAttack.reach = modAttack.reach
		editAttack.number = modAttack.number
		editAttack.ammo = Int64(modAmmo)
		editAttack.malfunction = modAttack.malfunction
		editAttack.investigator = modAttack.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ATTACK DATA to core data model!")
		}
	}
	
	func fetchAttacks() -> [Attack] {
		
		let fetch = Attack.fetchRequest() as NSFetchRequest<Attack>
		let pred = NSPredicate(format: "investigator == %@", investigator)
		let sortName = NSSortDescriptor(key: "name", ascending: true)
		
		fetch.predicate = pred
		fetch.sortDescriptors = [sortName]
		
		do {
			self.attacks = try dataContext.fetch(fetch)
		} catch {
			fatalError("Unable to FETCH ATTACK DATA from core data model!")
		}
		
		return self.attacks
	}
	
	// MARK: - Item Data Logic
	
	func newItem(name: String, description: String, uses: Int) {
		
		let newItem = Item(context: self.dataContext)
		newItem.name = name
		newItem.descript = description
		newItem.uses = Int64(uses)
		newItem.investigator = self.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ITEM DATA in core data model!")
		}
	}
	
	func updateItem(for modItem: Item, newName: String, newUses: Int, newDescription: String) {
		
		let editItem = modItem
		editItem.name = newName
		editItem.descript = newDescription
		editItem.uses = Int64(newUses)
		editItem.investigator = modItem.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ITEM DATA to core data model!")
		}
	}
	
	func updateItemUses(for modItem: Item, with modUses: Int) {
		
		let editItem = modItem
		editItem.name = modItem.name
		editItem.descript = modItem.descript
		editItem.uses = Int64(modUses)
		editItem.investigator = modItem.investigator
		
		do {
			try dataContext.save()
		} catch {
			fatalError("Unable to SAVE ITEM DATA to core data model!")
		}
	}

	func fetchItems() -> [Item] {
		let fetch = Item.fetchRequest() as NSFetchRequest<Item>
		let pred = NSPredicate(format: "investigator == %@", investigator)
		let sortName = NSSortDescriptor(key: "name", ascending: true)
		
		fetch.predicate = pred
		fetch.sortDescriptors = [sortName]
		
		do {
			self.items = try dataContext.fetch(fetch)
		} catch {
			fatalError("Unable to FETCH ITEM DATA from core data model!")
		}
		
		return self.items
	}
}
