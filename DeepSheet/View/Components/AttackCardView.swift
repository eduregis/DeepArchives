//
//  AttackCardView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 02/12/20.
//

import UIKit

class AttackCardView: UIView {

	weak var combatDelegate: CombatDelegate?
	
	var damageDiceValue: String
	
	// MARK: - Components
	
	lazy var attackLabelBackground: UIImageView = {
		let background = UIImageView()
		let backgroundColor = UIImage.imageWithColor(color: .lightSeaGreen)
		background.translatesAutoresizingMaskIntoConstraints = false
		background.image = backgroundColor
		self.addSubview(background)
		return background
	}()
	
	lazy var attackLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .backgroundBlack
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var attackChanceBackground: UIImageView = {
		let view = UIImageView()
		let viewColor = UIImage.imageWithColor(color: .backgroundBlack)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = viewColor
		self.addSubview(view)
		return view
	}()
	
	lazy var attackChanceImage: UIImageView = {
		let view = UIImageView()
		let image = UIImage(named: "d10-green")
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = image
		view.backgroundColor = .backgroundBlack
		view.contentMode = .scaleAspectFit
		self.addSubview(view)
		return view
	}()
	
	lazy var attackChanceValue: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold25()
		label.textAlignment = .center
		label.textColor = .lightSeaGreen
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var attackChanceBy2Background: UIImageView = {
		let view = UIImageView()
		let viewColor = UIImage.imageWithColor(color: .darkSeaGreen)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = viewColor
		self.addSubview(view)
		return view
	}()
	
	lazy var attackChanceBy2Value: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold25()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var attackChanceBy5Background: UIImageView = {
		let view = UIImageView()
		let viewColor = UIImage.imageWithColor(color: .darkSeaGreen)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = viewColor
		self.addSubview(view)
		return view
	}()
	
	lazy var attackChanceBy5Value: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold25()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var attackBaseChance: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(attackChanceBackground)
		self.addSubview(attackChanceImage)
		self.addSubview(attackChanceValue)
		self.addSubview(view)
		return view
	}()
	
	lazy var attackBy2Chance: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(attackChanceBy2Background)
		self.addSubview(attackChanceBy2Value)
		self.addSubview(view)
		return view
	}()
	
	lazy var attackBy5Chance: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(attackChanceBy5Background)
		self.addSubview(attackChanceBy5Value)
		self.addSubview(view)
		return view
	}()
	
	lazy var malfuncLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var malfuncBackground: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		let color = UIImage.imageWithColor(color: .backgroundBlack)
		view.image = color
		self.addSubview(view)
		return view
	}()
	
	lazy var ammoBackground: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		let color = UIImage.imageWithColor(color: .backgroundBlack)
		view.image = color
		self.addSubview(view)
		return view
	}()
	
	lazy var ammoLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var ammoField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(field)
		field.font = UIFont.josefinSansBold17()
		field.textColor = .backgroundBlack
		field.textAlignment = .center
		field.backgroundColor = .ivory
		field.layer.borderWidth = 1
		field.layer.cornerRadius = 5
		field.layer.borderColor = UIColor.systemGray3.cgColor
		field.keyboardType = .numberPad
		return field
	}()
	
	lazy var numAttacksBackground: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		let color = UIImage.imageWithColor(color: .backgroundBlack)
		view.image = color
		self.addSubview(view)
		return view
	}()
	
	lazy var numAttacksLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var reachBackground: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		let color = UIImage.imageWithColor(color: .backgroundBlack)
		view.image = color
		self.addSubview(view)
		return view
	}()
	
	lazy var reachLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var diceBackground: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		let color = UIImage.imageWithColor(color: .backgroundBlack)
		view.image = color
		self.addSubview(view)
		return view
	}()
	
	lazy var diceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .left
		label.textColor = .lightSeaGreen
		label.backgroundColor = .clear
		self.addSubview(label)
		return label
	}()
	
	lazy var diceImage: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.contentMode = .scaleAspectFit
		let image = UIImage(named: "d10-green")
		view.image = image
		self.addSubview(view)
		return view
	}()
	
	lazy var attackDiceButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .none
		button.addTarget(self, action: #selector(rollAttackDice), for: .touchUpInside)
		self.addSubview(button)
		return button
	}()
	
	@objc func rollAttackDice() {
		print("Attacking with \(attackLabel.text!)")
		combatDelegate?.triggerDice(diceText: attackLabel.text!, diceType: "d100")
	}
	
	lazy var damageDiceButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .none
		button.addTarget(self, action: #selector(rollDamageDice), for: .touchUpInside)
		self.addSubview(button)
		return button
	}()
	
	@objc func rollDamageDice() {
		print("Damage caused by \(attackLabel.text!)")
		combatDelegate?.triggerDamageDice(attackName: attackLabel.text!, diceType: damageDiceValue)
	}
	
	lazy var editButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "pencil"), for: .normal)
		button.imageView?.contentMode = .scaleAspectFit
		button.tintColor = .backgroundBlack
		self.addSubview(button)
		return button
	}()
	
	override func draw(_ rect: CGRect) {
		self.layer.borderWidth = 3
		self.layer.cornerRadius = 5
		self.layer.borderColor = UIColor.lightSeaGreen.cgColor
		self.backgroundColor = .clear
	}
	
	init(attackName: String, chance: Int, dice: String, reach: Int, num: Int, ammo: Int, malfunction: Int) {
		
		damageDiceValue = dice
		
		super.init(frame: .zero)
		
		configureLayout()
		
		attackLabel.text = attackName
		attackChanceValue.text = "\(chance)"
		attackChanceBy2Value.text = "\(Int(chance / 2))"
		attackChanceBy5Value.text = "\(Int(chance / 5))"
		
		reachLabel.text = "Alcance: \(reach) m"
		malfuncLabel.text = "Malfunc.: \(malfunction)%"
		
		diceLabel.text = "Dado: \(damageDiceValue)"
		numAttacksLabel.text = "Ataques: \(num)"
		ammoLabel.text = "Munição:"
		ammoField.text = "\(ammo)"
	}
	
	func setCombatDelegate(with delegate: CombatDelegate) {
		combatDelegate = delegate
	}
	
	// MARK: - Layout Constraints
	private func configureLayout() {
		NSLayoutConstraint.activate([
			self.heightAnchor.constraint(equalToConstant: 125),
			
			attackLabelBackground.topAnchor.constraint(equalTo: self.topAnchor),
			attackLabelBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			attackLabelBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
			attackLabelBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			
			attackBy5Chance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBy5Chance.bottomAnchor.constraint(equalTo: attackBy5Chance.topAnchor, constant: 45),
			attackBy5Chance.widthAnchor.constraint(equalToConstant: 45),
			attackBy5Chance.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			
			attackChanceBy5Background.topAnchor.constraint(equalTo: attackBy5Chance.topAnchor),
			attackChanceBy5Background.bottomAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor),
			attackChanceBy5Background.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBy5Background.leftAnchor.constraint(equalTo: attackBy5Chance.leftAnchor),
			
			attackChanceBy5Value.centerXAnchor.constraint(equalTo: attackBy5Chance.centerXAnchor),
			attackChanceBy5Value.centerYAnchor.constraint(equalTo: attackBy5Chance.centerYAnchor),
			
			attackBy2Chance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBy2Chance.bottomAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor),
			attackBy2Chance.widthAnchor.constraint(equalToConstant: 45),
			attackBy2Chance.rightAnchor.constraint(equalTo: attackBy5Chance.leftAnchor, constant: -3),
			
			attackChanceBy2Background.topAnchor.constraint(equalTo: attackBy2Chance.topAnchor),
			attackChanceBy2Background.bottomAnchor.constraint(equalTo: attackBy2Chance.bottomAnchor),
			attackChanceBy2Background.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBy2Background.leftAnchor.constraint(equalTo: attackBy2Chance.leftAnchor),
			
			attackChanceBy2Value.centerXAnchor.constraint(equalTo: attackBy2Chance.centerXAnchor),
			attackChanceBy2Value.centerYAnchor.constraint(equalTo: attackBy2Chance.centerYAnchor),
			
			attackBaseChance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBaseChance.bottomAnchor.constraint(equalTo: attackBy2Chance.bottomAnchor),
			attackBaseChance.widthAnchor.constraint(equalToConstant: 45),
			attackBaseChance.rightAnchor.constraint(equalTo: attackBy2Chance.leftAnchor, constant: -3),
			
			attackChanceBackground.topAnchor.constraint(equalTo: attackBaseChance.topAnchor),
			attackChanceBackground.bottomAnchor.constraint(equalTo: attackBaseChance.bottomAnchor),
			attackChanceBackground.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBackground.leftAnchor.constraint(equalTo: attackBaseChance.leftAnchor),
			
			attackChanceImage.centerXAnchor.constraint(equalTo: attackChanceBackground.centerXAnchor),
			attackChanceImage.centerYAnchor.constraint(equalTo: attackChanceBackground.centerYAnchor),
			attackChanceImage.topAnchor.constraint(equalTo: attackChanceBackground.topAnchor, constant: 2.5),
			attackChanceImage.bottomAnchor.constraint(equalTo: attackChanceBackground.bottomAnchor, constant: -2.5),
			attackChanceImage.widthAnchor.constraint(equalToConstant: 40),
			
			attackChanceValue.centerXAnchor.constraint(equalTo: attackChanceImage.centerXAnchor),
			attackChanceValue.centerYAnchor.constraint(equalTo: attackChanceImage.centerYAnchor),
			
			attackLabel.centerYAnchor.constraint(equalTo: attackBaseChance.centerYAnchor),
			attackLabel.leftAnchor.constraint(equalTo: attackLabelBackground.leftAnchor, constant: 15),
			
			editButton.centerYAnchor.constraint(equalTo: attackBaseChance.centerYAnchor),
			editButton.heightAnchor.constraint(equalToConstant: 45),
			editButton.leftAnchor.constraint(equalTo: attackLabel.rightAnchor, constant: 0),
			editButton.widthAnchor.constraint(equalToConstant: 45),
			
			malfuncBackground.topAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor, constant: 3),
			malfuncBackground.bottomAnchor.constraint(equalTo: malfuncBackground.topAnchor, constant: 35),
			malfuncBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			malfuncBackground.leftAnchor.constraint(equalTo: malfuncBackground.rightAnchor, constant: -125),
			
			malfuncLabel.centerYAnchor.constraint(equalTo: malfuncBackground.centerYAnchor),
			malfuncLabel.leftAnchor.constraint(equalTo: malfuncBackground.leftAnchor, constant: 8),
			
			numAttacksBackground.topAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor, constant: 3),
			numAttacksBackground.bottomAnchor.constraint(equalTo: numAttacksBackground.topAnchor, constant: 35),
			numAttacksBackground.rightAnchor.constraint(equalTo: malfuncBackground.leftAnchor, constant: -3),
			numAttacksBackground.leftAnchor.constraint(equalTo: numAttacksBackground.rightAnchor, constant: -105),
			
			numAttacksLabel.centerYAnchor.constraint(equalTo: numAttacksBackground.centerYAnchor),
			numAttacksLabel.leftAnchor.constraint(equalTo: numAttacksBackground.leftAnchor, constant: 8),
			
			reachBackground.topAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor, constant: 3),
			reachBackground.bottomAnchor.constraint(equalTo: reachBackground.topAnchor, constant: 35),
			reachBackground.rightAnchor.constraint(equalTo: numAttacksBackground.leftAnchor, constant: -3),
			reachBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
			
			reachLabel.centerYAnchor.constraint(equalTo: reachBackground.centerYAnchor),
			reachLabel.leftAnchor.constraint(equalTo: reachBackground.leftAnchor, constant: 8),
			
			ammoBackground.topAnchor.constraint(equalTo: malfuncBackground.bottomAnchor, constant: 3),
			ammoBackground.bottomAnchor.constraint(equalTo: ammoBackground.topAnchor, constant: 35),
			ammoBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			ammoBackground.leftAnchor.constraint(equalTo: ammoBackground.rightAnchor, constant: -155),
			
			ammoLabel.centerYAnchor.constraint(equalTo: ammoBackground.centerYAnchor),
			ammoLabel.leftAnchor.constraint(equalTo: ammoBackground.leftAnchor, constant: 8),
			
			ammoField.topAnchor.constraint(equalTo: ammoBackground.topAnchor, constant: 5),
			ammoField.bottomAnchor.constraint(equalTo: ammoBackground.bottomAnchor, constant: -5),
			ammoField.leftAnchor.constraint(equalTo: ammoLabel.rightAnchor, constant: 5),
			ammoField.rightAnchor.constraint(equalTo: ammoField.leftAnchor, constant: 45),
			
			diceBackground.topAnchor.constraint(equalTo: malfuncBackground.bottomAnchor, constant: 3),
			diceBackground.bottomAnchor.constraint(equalTo: diceBackground.topAnchor, constant: 35),
			diceBackground.rightAnchor.constraint(equalTo: ammoBackground.leftAnchor, constant: -3),
			diceBackground.leftAnchor.constraint(equalTo: reachBackground.leftAnchor),
			
			diceLabel.centerYAnchor.constraint(equalTo: diceBackground.centerYAnchor),
			diceLabel.leftAnchor.constraint(equalTo: diceBackground.leftAnchor, constant: 8),
			diceLabel.rightAnchor.constraint(equalTo: diceLabel.leftAnchor, constant: 130),
			
			diceImage.topAnchor.constraint(equalTo: diceBackground.topAnchor, constant: 3),
			diceImage.bottomAnchor.constraint(equalTo: diceBackground.bottomAnchor, constant: -4),
			diceImage.leftAnchor.constraint(equalTo: diceLabel.rightAnchor, constant: 5),
			diceImage.rightAnchor.constraint(equalTo: diceImage.leftAnchor, constant: 30),
			
			attackDiceButton.topAnchor.constraint(equalTo: attackBaseChance.topAnchor),
			attackDiceButton.bottomAnchor.constraint(equalTo: attackBaseChance.bottomAnchor),
			attackDiceButton.leftAnchor.constraint(equalTo: attackBaseChance.leftAnchor),
			attackDiceButton.rightAnchor.constraint(equalTo: attackBy5Chance.rightAnchor),
			
			damageDiceButton.topAnchor.constraint(equalTo: diceBackground.topAnchor),
			damageDiceButton.bottomAnchor.constraint(equalTo: diceBackground.bottomAnchor),
			damageDiceButton.leftAnchor.constraint(equalTo: diceBackground.leftAnchor),
			damageDiceButton.rightAnchor.constraint(equalTo: diceBackground.rightAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setAmmoFieldDelegate(with delegate: UITextFieldDelegate) {
		ammoField.delegate = delegate
	}
}
