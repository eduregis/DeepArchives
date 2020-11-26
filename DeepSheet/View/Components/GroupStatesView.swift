//
//  GroupStatesView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class GroupStatesView: UIView {

	lazy var tempInsView: IndvStatesView = {
		let states = IndvStatesView(stateName: LocalizedStrings.tempInsLabel)
		states.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(states)
		return states
	}()
	
	lazy var indefInsView: IndvStatesView = {
		let states = IndvStatesView(stateName: LocalizedStrings.indefInsLabel)
		states.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(states)
		return states
	}()
	
	lazy var incapacView: IndvStatesView = {
		let states = IndvStatesView(stateName: LocalizedStrings.incapacLabel)
		states.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(states)
		return states
	}()

	lazy var woundView: IndvStatesView = {
		let states = IndvStatesView(stateName: LocalizedStrings.woundLabel)
		states.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(states)
		return states
	}()
	
	lazy var statesStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [tempInsView, indefInsView, incapacView, woundView])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 15
		self.addSubview(stack)
		return stack
	}()
	
	lazy var groupLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold()
		label.text = LocalizedStrings.statesTitle
		label.textAlignment = .center
		label.textColor = .ivory
		label.backgroundColor = .clear
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		configureLayout()
	}
	
	// MARK: - Layout Constraints
	private func configureLayout() {
		NSLayoutConstraint.activate([
			statesStack.leftAnchor.constraint(equalTo: self.leftAnchor),
			statesStack.rightAnchor.constraint(equalTo: self.rightAnchor),
			statesStack.topAnchor.constraint(equalTo: self.topAnchor),
			statesStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			groupLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
			groupLabel.bottomAnchor.constraint(equalTo: statesStack.topAnchor, constant: -5)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented, because will not be used on IB")
	}
	
}
