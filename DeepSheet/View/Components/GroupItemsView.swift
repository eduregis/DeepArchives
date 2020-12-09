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
		label.text = LocalizedStrings.itemsTitle
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var addButton: AdditionCardView = {
		let addCard = AdditionCardView()
		addCard.translatesAutoresizingMaskIntoConstraints = false
		addCard.additionCardLabel.text = LocalizedStrings.addItemsButton
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
	
	init(with items: [Item]) {
		super.init(frame: .zero)
		
		for new in items {
			var newItem = ItemCardView(itemName: new.name!, itemDescription: new.descript!, itemUses: Int(new.uses))
			itemStack.addArrangedSubview(newItem)
		}

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
	
	func setTextDelegates(with delegate: UITextFieldDelegate) {
		for item in itemStack.arrangedSubviews {
			var actualItem = item as! ItemCardView
			actualItem.setItemUsesDelegate(with: delegate)
		}
	}
	
	func updateItems(with items: [Item]) {
		
		for item in itemStack.arrangedSubviews {
			item.removeFromSuperview()
		}
		
		for new in items {
			var newItem = ItemCardView(itemName: new.name!, itemDescription: new.descript!, itemUses: Int(new.uses))
			itemStack.addArrangedSubview(newItem)
		}
	}

}
