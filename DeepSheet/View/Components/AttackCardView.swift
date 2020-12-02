//
//  AttackCardView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 02/12/20.
//

import UIKit

class AttackCardView: UIView {

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
	
	init(attackName: String, chance: Int) {
		
		super.init(frame: .zero)
		
		configureLayout()
		
		attackLabel.text = attackName
		attackChanceValue.text = "\(chance)"
		attackChanceBy2Value.text = "\(Int(chance / 2))"
		attackChanceBy5Value.text = "\(Int(chance / 5))"
	}
	
	// MARK: - Layout Constraints
	private func configureLayout() {
		NSLayoutConstraint.activate([
			self.heightAnchor.constraint(equalToConstant: 130),
			
			attackLabelBackground.topAnchor.constraint(equalTo: self.topAnchor),
			attackLabelBackground.heightAnchor.constraint(equalToConstant: 45),
			attackLabelBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
			attackLabelBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			
			editButton.topAnchor.constraint(equalTo: attackLabelBackground.topAnchor, constant: 5),
			editButton.bottomAnchor.constraint(equalTo: attackLabelBackground.bottomAnchor, constant: -5),
			editButton.leftAnchor.constraint(equalTo: attackLabel.rightAnchor, constant: 0),
			editButton.widthAnchor.constraint(equalToConstant: 45),
			
			attackLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
			attackLabel.leftAnchor.constraint(equalTo: attackLabelBackground.leftAnchor, constant: 15),
			
			attackBy5Chance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBy5Chance.bottomAnchor.constraint(equalTo: attackLabelBackground.bottomAnchor, constant: -3),
			attackBy5Chance.widthAnchor.constraint(equalToConstant: 45),
			attackBy5Chance.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
			
			attackChanceBy5Background.topAnchor.constraint(equalTo: attackBy5Chance.topAnchor),
			attackChanceBy5Background.bottomAnchor.constraint(equalTo: attackBy5Chance.bottomAnchor),
			attackChanceBy5Background.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBy5Background.leftAnchor.constraint(equalTo: attackBy5Chance.leftAnchor),
			
			attackChanceBy5Value.centerXAnchor.constraint(equalTo: attackBy5Chance.centerXAnchor),
			attackChanceBy5Value.centerYAnchor.constraint(equalTo: attackBy5Chance.centerYAnchor),
			
			attackBy2Chance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBy2Chance.bottomAnchor.constraint(equalTo: attackLabelBackground.bottomAnchor, constant: -3),
			attackBy2Chance.widthAnchor.constraint(equalToConstant: 45),
			attackBy2Chance.rightAnchor.constraint(equalTo: attackBy5Chance.leftAnchor, constant: -3),
			
			attackChanceBy2Background.topAnchor.constraint(equalTo: attackBy2Chance.topAnchor),
			attackChanceBy2Background.bottomAnchor.constraint(equalTo: attackBy2Chance.bottomAnchor),
			attackChanceBy2Background.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBy2Background.leftAnchor.constraint(equalTo: attackBy2Chance.leftAnchor),
			
			attackChanceBy2Value.centerXAnchor.constraint(equalTo: attackBy2Chance.centerXAnchor),
			attackChanceBy2Value.centerYAnchor.constraint(equalTo: attackBy2Chance.centerYAnchor),
			
			attackBaseChance.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackBaseChance.bottomAnchor.constraint(equalTo: attackLabelBackground.bottomAnchor, constant: -3),
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
			attackChanceValue.centerYAnchor.constraint(equalTo: attackChanceImage.centerYAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
