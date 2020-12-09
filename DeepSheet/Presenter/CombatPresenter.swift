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
	
	let investigator: Investigator
	
	init(_ investigator: Investigator) {
		self.investigator = investigator
		items = fetchItems()
	}
	
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
			fatalError("Unable to FETCH ITEM DATA from core datal model!")
		}
		
		return self.items
	}
}
