//
//  GroupItemsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 08/12/20.
//

import UIKit

class GroupItemsView: UIView {

	// MARK: - Components
	
	lazy var stackLabel: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold()
		label.text = "Items"
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var addButton: AdditionCardView = {
		let addCard = AdditionCardView()
		addCard.translatesAutoresizingMaskIntoConstraints = false
		addCard.additionCardLabel.text = "Adicionar Item"
		self.addSubview(addCard)
		return addCard
	}()
	
	lazy var itemStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .fill
		stack.distribution = .fillEqually
		stack.spacing = 15
		return stack
	}()
	
	lazy var itemScrolling: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
		scroll.showsVerticalScrollIndicator = false
		self.addSubview(scroll)
		return scroll
	}()
	
	init() {
		super.init(frame: .zero)
		let items = [
			ItemCardView(itemName: "Medkit", itemDescription: "Cura as galera tudo", itemUses: 999),
			ItemCardView(itemName: "Medkit", itemDescription: "Cura as galera tudo", itemUses: 999)
			]
		itemStack.addArrangedSubview(items[0])
		itemStack.addArrangedSubview(items[1])

		configureLayout()
	}
	
	private func configureLayout() {
		itemScrolling.addSubview(itemStack)
		
		NSLayoutConstraint.activate([
			stackLabel.topAnchor.constraint(equalTo: self.topAnchor),
			stackLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
			
			addButton.topAnchor.constraint(equalTo: stackLabel.bottomAnchor, constant: 10),
			addButton.leftAnchor.constraint(equalTo: self.leftAnchor),
			addButton.rightAnchor.constraint(equalTo: self.rightAnchor),
			
			itemScrolling.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 5),
			itemScrolling.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			itemScrolling.leftAnchor.constraint(equalTo: self.leftAnchor),
			itemScrolling.rightAnchor.constraint(equalTo: self.rightAnchor),
			
			itemStack.topAnchor.constraint(equalTo: itemScrolling.topAnchor),
			itemStack.bottomAnchor.constraint(equalTo: itemScrolling.bottomAnchor),
			itemStack.leftAnchor.constraint(equalTo: self.leftAnchor),
			itemStack.rightAnchor.constraint(equalTo: self.rightAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Logic
	
	func addItem() {
		let item = ItemCardView(itemName: "FOGO", itemDescription: "QUEIMA", itemUses: 100)
		itemStack.addArrangedSubview(item)
	}

}
