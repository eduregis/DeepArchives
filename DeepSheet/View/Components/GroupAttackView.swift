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
		label.text = LocalizedStrings.attacksTitle
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var addButton: AdditionCardView = {
		let addCard = AdditionCardView()
		addCard.translatesAutoresizingMaskIntoConstraints = false
		addCard.additionCardLabel.text = LocalizedStrings.addAttacksButton
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
	
	init(with attacks: [Attack], and delegate: CombatDelegate) {
		super.init(frame: .zero)
		
		for new in attacks {
			var newAttack = AttackCardView(attackName: new.name!, chance: Int(new.chance), dice: new.dice!, reach: Int(new.reach), num: Int(new.number), ammo: Int(new.ammo), malfunction: Int(new.malfunction))
			attacksStack.addArrangedSubview(newAttack)
		}
		
		setAttacksDelegate(with: delegate)

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
	
	func setTextDelegates(with delegate: UITextFieldDelegate) {
		for attack in attacksStack.arrangedSubviews {
			var actualAttack = attack as! AttackCardView
			actualAttack.setAmmoFieldDelegate(with: delegate)
		}
	}
	
	func updateAttacks(with attacks: [Attack], and delegate: CombatDelegate) {
		
		for attack in attacksStack.arrangedSubviews {
			attack.removeFromSuperview()
		}
		
		for new in attacks {
			var newAttack = AttackCardView(attackName: new.name!, chance: Int(new.chance), dice: new.dice!, reach: Int(new.reach), num: Int(new.number), ammo: Int(new.ammo), malfunction: Int(new.malfunction))
			attacksStack.addArrangedSubview(newAttack)
		}
		
		setAttacksDelegate(with: delegate)
	}
	
	func setAttacksDelegate(with delegate: CombatDelegate) {
		for attack in attacksStack.arrangedSubviews {
			var currentAttack = attack as! AttackCardView
			currentAttack.setCombatDelegate(with: delegate)
		}
	}

}
