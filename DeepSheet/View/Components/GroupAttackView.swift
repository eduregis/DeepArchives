//
//  GroupAttackView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 07/12/20.
//

import UIKit

class GroupAttackView: UIView {
	
	// MARK: - Components
	
	lazy var stackLabel: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold()
		label.text = "Golpes"
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var addButton: AdditionCardView = {
		let addCard = AdditionCardView()
		addCard.translatesAutoresizingMaskIntoConstraints = false
		addCard.additionCardLabel.text = "Adicionar Golpe"
		self.addSubview(addCard)
		return addCard
	}()
	
	lazy var attacksStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .fill
		stack.distribution = .fillEqually
		stack.spacing = 15
		return stack
	}()
	
	lazy var attackScrolling: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: self.frame.width, height: self.frame.height)
		scroll.showsVerticalScrollIndicator = false
		self.addSubview(scroll)
		return scroll
	}()
	
	init() {
		super.init(frame: .zero)
		let attacks = [
			AttackCardView(attackName: "Revolver", chance: 25, dice: "1d4", reach: 20, num: 1, ammo: 5, malfunction: 15),
			AttackCardView(attackName: "Scimitar", chance: 95, dice: "1d8", reach: 3, num: 2, ammo: 0, malfunction: 0)
			]
		attacksStack.addArrangedSubview(attacks[0])
		attacksStack.addArrangedSubview(attacks[1])

		configureLayout()
	}
	
	private func configureLayout() {
		attackScrolling.addSubview(attacksStack)
		
		NSLayoutConstraint.activate([
			stackLabel.topAnchor.constraint(equalTo: self.topAnchor),
			stackLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
			
			addButton.topAnchor.constraint(equalTo: stackLabel.bottomAnchor, constant: 10),
			addButton.leftAnchor.constraint(equalTo: self.leftAnchor),
			addButton.rightAnchor.constraint(equalTo: self.rightAnchor),
			
			attackScrolling.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 5),
			attackScrolling.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			attackScrolling.leftAnchor.constraint(equalTo: self.leftAnchor),
			attackScrolling.rightAnchor.constraint(equalTo: self.rightAnchor),
			
			attacksStack.topAnchor.constraint(equalTo: attackScrolling.topAnchor),
			attacksStack.bottomAnchor.constraint(equalTo: attackScrolling.bottomAnchor),
			attacksStack.leftAnchor.constraint(equalTo: self.leftAnchor),
			attacksStack.rightAnchor.constraint(equalTo: self.rightAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Logic
	
	func addAttack() {
		let attack = AttackCardView(attackName: "EXCALIBUR", chance: 100, dice: "1d20", reach: 100, num: 20, ammo: 0, malfunction: 0)
		attacksStack.addArrangedSubview(attack)
	}
	
	func setAttacksDelegate(with delegate: CombatDelegate) {
		for attack in attacksStack.arrangedSubviews {
			var currentAttack = attack as! AttackCardView
			currentAttack.setCombatDelegate(with: delegate)
		}
	}

}
