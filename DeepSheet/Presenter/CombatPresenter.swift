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
	
	var items: [Item] = []
	
	var attacks: [Attack] = []
	
	let investigator: Investigator
	
	init(_ investigator: Investigator) {
		self.investigator = investigator
		items = fetchItems()
		attacks = fetchAttacks()
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