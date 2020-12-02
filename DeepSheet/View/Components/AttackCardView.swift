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
	
	lazy var attackChance: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold25()
		label.textAlignment = .center
		label.textColor = .lightSeaGreen
		label.backgroundColor = .clear
		return label
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
		attackChance.text = "\(chance)"
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
			
			attackChanceBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
			attackChanceBackground.bottomAnchor.constraint(equalTo: attackLabelBackground.bottomAnchor, constant: -3),
			attackChanceBackground.widthAnchor.constraint(equalToConstant: 45),
			attackChanceBackground.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -120),
			
			attackChanceImage.centerXAnchor.constraint(equalTo: attackChanceBackground.centerXAnchor),
			attackChanceImage.centerYAnchor.constraint(equalTo: attackChanceBackground.centerYAnchor),
			attackChanceImage.topAnchor.constraint(equalTo: attackChanceBackground.topAnchor, constant: 2.5),
			attackChanceImage.bottomAnchor.constraint(equalTo: attackChanceBackground.bottomAnchor, constant: -2.5),
			attackChanceImage.widthAnchor.constraint(equalToConstant: 40),
			
			attackChance.centerXAnchor.constraint(equalTo: attackChanceImage.centerXAnchor),
			attackChance.centerYAnchor.constraint(equalTo: attackChanceImage.centerYAnchor)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
