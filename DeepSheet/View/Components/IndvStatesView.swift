//
//  IndvStatesView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class IndvStatesView: UIView {

	var stateChecked: Bool = true
	
	lazy var stateLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansRegular()
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	lazy var stateCheckbox: UIImageView = {
		let checkbox = UIImageView()
		var checkBorder = UIImage.imageWithColor(color: .clear)
		checkbox.translatesAutoresizingMaskIntoConstraints = false
		checkbox.image = checkBorder
		checkbox.layer.borderWidth = 3
		checkbox.layer.cornerRadius = 5
		checkbox.layer.borderColor = UIColor.goldenYellow.cgColor
		self.addSubview(checkbox)
		return checkbox
	}()
	
	lazy var stateButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(self.callCheckState), for: .touchUpInside)
		button.backgroundColor = .clear
		self.addSubview(button)
		return button
	}()
	
	lazy var checkMark: UIImageView = {
		let checkMark = UIImageView()
		// MARK: Replace with actual checkmark image
		var check = UIImage.imageWithColor(color: .shockingPink)
		checkMark.translatesAutoresizingMaskIntoConstraints = false
		checkMark.image = check
		self.addSubview(checkMark)
		return checkMark
	}()
	
	init(stateName: String) {
		super.init(frame: .zero)
		configureLayout()
		toggleCheckMark()
		
		stateLabel.text = stateName
	}
	
	override func draw(_ rect: CGRect) {
		self.layer.borderWidth = 3
		self.layer.cornerRadius = 5
		self.layer.borderColor = UIColor.goldenYellow.cgColor
		self.backgroundColor = .clear
	}

	// MARK: - Layout Constraints
	private func configureLayout() {
		NSLayoutConstraint.activate([
			self.heightAnchor.constraint(equalToConstant: 44),
			
			stateLabel.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: 160),
			stateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			
			stateCheckbox.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			stateCheckbox.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
			stateCheckbox.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
			stateCheckbox.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
			
			checkMark.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			checkMark.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
			checkMark.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
			checkMark.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
			
			stateButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
			stateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
			stateButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
			stateButton.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -35)
		])
	}
	
	// MARK: - Logic
	func toggleCheckMark() {
		checkMark.isHidden = !checkMark.isHidden
		stateChecked = !stateChecked
	}
	
	@objc func callCheckState(sender: UIButton) {
		print("Check State for \(stateLabel.text!)")
		toggleCheckMark()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
