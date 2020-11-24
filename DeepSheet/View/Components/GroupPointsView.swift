//
//  GroupPointsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class GroupPointsView: UIView {
	
	// MARK: - Components
	lazy var luckView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.luckPoints, diceToggle: true, maxValue: 888)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var magicView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.magicPoints, diceToggle: false, maxValue: 888)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var sanityView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.sanityPoints, diceToggle: true, maxValue: 888)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var healthView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.healthPoints, diceToggle: false, maxValue: 888)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var pointsStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [luckView, magicView, sanityView, healthView])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .fill
		stack.distribution = .fillEqually
		stack.spacing = 15
		self.addSubview(stack)
		return stack
	}()
	
	lazy var groupLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		label.font = UIFont.josefinSansBold()
		label.text = LocalizedStrings.pointsTitle
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
			pointsStack.leftAnchor.constraint(equalTo: self.leftAnchor),
			pointsStack.rightAnchor.constraint(equalTo: self.rightAnchor),
			pointsStack.topAnchor.constraint(equalTo: self.topAnchor),
			pointsStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			groupLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
			groupLabel.bottomAnchor.constraint(equalTo: pointsStack.topAnchor, constant: -5)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented, because will not be used on IB")
	}
}
