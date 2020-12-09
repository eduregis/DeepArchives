//
//  StatsPointsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class IndvPointsView: UIView {
	
	var rollName: String
	
	var diceType: String
	
	var hasDiceButton: Bool
	
	var pointsValue: (current: Int64, maximum: Int64) = (0, 0)
	
	var isEditModeEnabled: Bool = false
	
	var hasDiceRolled: Bool = false
	
	// MARK: - Components
	lazy var pointTextBackground: UIImageView = {
		let background = UIImageView()
		let backgroundColor = UIImage.imageWithColor(color: .palePurple)
		background.translatesAutoresizingMaskIntoConstraints = false
		background.image = backgroundColor
		self.addSubview(background)
		return background
	}()
	
	lazy var diceImage: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var pointLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold17()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var currentValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansRegular()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var maxValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansRegular()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var currentValueField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(field)
		field.font = UIFont.josefinSansRegular()
		field.textColor = .backgroundBlack
		field.textAlignment = .center
		field.backgroundColor = .ivory
		field.layer.borderWidth = 1
		field.layer.cornerRadius = 5
		field.layer.borderColor = UIColor.systemGray3.cgColor
		field.keyboardType = .numberPad
		return field
	}()
	
	lazy var maxValueField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(field)
		field.font = UIFont.josefinSansRegular()
		field.textColor = .backgroundBlack
		field.textAlignment = .center
		field.backgroundColor = .ivory
		field.layer.borderWidth = 1
		field.layer.cornerRadius = 5
		field.layer.borderColor = UIColor.systemGray3.cgColor
		field.keyboardType = .numberPad
		return field
	}()
	
	lazy var pointBarIndicator: UIImageView = {
		let bar = UIImageView()
		var barColor = UIImage.imageWithColor(color: .shockingPink)
		bar.translatesAutoresizingMaskIntoConstraints = false
		bar.image = barColor
		self.addSubview(bar)
		return bar
	}()
	
	lazy var diceButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .none
		button.addTarget(self, action: #selector(self.callDiceRoll), for: .touchUpInside)
		return button
	}()
	
	init(pointName: String, rollName: String = "", diceType: String = "", diceButton: Bool) {
		
		self.rollName = rollName
		self.diceType = diceType
		self.hasDiceButton = diceButton
		
		super.init(frame: .zero)
		
		configureLayout()
		
		diceImage.image = UIImage(named: "d10-purple")
		pointLabel.text = pointName
	
		toggleEditMode(as: isEditModeEnabled)
	}
	
	override func draw(_ rect: CGRect) {
		self.layer.borderWidth = 3
		self.layer.cornerRadius = 5
		self.layer.borderColor = UIColor.palePurple.cgColor
		self.backgroundColor = .clear
	}
	
	// MARK: - Layout Constraints
	private func configureLayout() {
		NSLayoutConstraint.activate([
			self.heightAnchor.constraint(equalToConstant: 44),
			
			pointBarIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
			pointBarIndicator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 156),
			pointBarIndicator.heightAnchor.constraint(equalToConstant: 10),
			pointBarIndicator.widthAnchor.constraint(equalToConstant: 223),
			
			pointTextBackground.topAnchor.constraint(equalTo: self.topAnchor),
			pointTextBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			pointTextBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
			pointTextBackground.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 156),
			
			pointLabel.topAnchor.constraint(equalTo: self.topAnchor),
			pointLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			pointLabel.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: 57),
			
			currentValueField.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
			currentValueField.widthAnchor.constraint(equalToConstant: 50),
			currentValueField.rightAnchor.constraint(equalTo: maxValueLabel.leftAnchor, constant: -3),
			
			maxValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			maxValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
			
			currentValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			currentValueLabel.rightAnchor.constraint(equalTo: maxValueField.leftAnchor, constant: -3),
			
			maxValueField.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
			maxValueField.widthAnchor.constraint(equalToConstant: 50),
			maxValueField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6)
		])
			
		if hasDiceButton {
			self.addSubview(diceImage)
			self.addSubview(diceButton)
			
			NSLayoutConstraint.activate([
				diceImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
				diceImage.widthAnchor.constraint(equalToConstant: 35),
				diceImage.heightAnchor.constraint(equalToConstant: 35),
				diceImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 110),
				
				diceButton.topAnchor.constraint(equalTo: self.topAnchor),
				diceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
				diceButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
				diceButton.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 156)
			])
		}
	}
	
	// MARK: - Editing Logic
	func setTextFieldDelegate(with delegate: UITextFieldDelegate) {
		currentValueField.delegate = delegate
		maxValueField.delegate = delegate
	}
	
	func rewritePoints(is bool: Bool) {
		if bool {
            pointsValue.current = Int64((currentValueField.text! as NSString).integerValue)
            pointsValue.maximum = Int64(maxValueField.text!)!
//            (maxValueField.text! as NSString).integerValue
		} else {
			currentValueField.text = "\(pointsValue.current)"
			maxValueField.text = "\(pointsValue.maximum)"
		}
		updatePointsDisplay(with: pointsValue)
	}
	
	func updatePointsDisplay(with new: (current: Int64, maximum: Int64)) {
		pointsValue.current = new.current
		pointsValue.maximum = new.maximum
		
		currentValueField.text = "\(pointsValue.current)"
		maxValueLabel.text = "/\(pointsValue.maximum)"
		
		currentValueLabel.text = "\(pointsValue.current)/"
		maxValueField.text = "\(pointsValue.maximum)"
	}
	
	func toggleEditMode(as toggle: Bool) {
		
		//Change point text fields
		if toggle {
			print("\(pointLabel.text!) Edit Mode ON")
			isEditModeEnabled = true
			
			currentValueField.isHidden = true
			maxValueLabel.isHidden = true
			
			currentValueLabel.isHidden = false
			maxValueField.isHidden = false
		} else {
			print("\(pointLabel.text!) Edit Mode OFF")
			isEditModeEnabled = false
			
			currentValueField.isHidden = false
			maxValueLabel.isHidden = false
			
			currentValueLabel.isHidden = true
			maxValueField.isHidden = true
		}
		
		if hasDiceButton {
			toggleDiceButton()
		}
	}
	
	//To be used in Edit Mode as to not allow rolling dice
	func toggleDiceButton() {
		
		if hasDiceButton {
			if isEditModeEnabled {
				diceImage.isHidden = true
				diceButton.isEnabled = false
			} else {
				diceImage.isHidden = false
				diceButton.isEnabled = true
			}
		}
	}
	
	// MARK: - Dice Roll Logic
	@objc func callDiceRoll(sender: UIButton) {
		hasDiceRolled = true
	}
	
	func resetDiceRoll() {
		hasDiceRolled = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
