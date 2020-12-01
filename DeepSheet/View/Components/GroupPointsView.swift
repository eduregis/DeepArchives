//
//  GroupPointsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class GroupPointsView: UIView {
	
	var isEditModeEnabled: Bool = false
	
	// MARK: - Components
	lazy var luckView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.luckPoints, rollName: LocalizedStrings.luckRoll ,diceType: LocalizedStrings.rollDiceD100, diceButton: true)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var magicView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.magicPoints, diceButton: false)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var sanityView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.sanityPoints, rollName: LocalizedStrings.sanityRoll, diceType: LocalizedStrings.rollDiceD100, diceButton: true)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(points)
		return points
	}()
	
	lazy var healthView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.healthPoints, diceButton: false)
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
	
	// MARK: - Editing Logic
	func getAllPointsValues() -> [(Int, Int)] {
		
		let arr = [
			luckView.pointsValue,
			magicView.pointsValue,
			sanityView.pointsValue,
			healthView.pointsValue
		]
		
		return arr
	}
	
	func setAllTextFieldDelegates(with delegate: UITextFieldDelegate) {
		luckView.setTextFieldDelegate(with: delegate)
		magicView.setTextFieldDelegate(with: delegate)
		sanityView.setTextFieldDelegate(with: delegate)
		healthView.setTextFieldDelegate(with: delegate)
	}
	
	func rewriteAllPoints(is bool: Bool) {
		luckView.rewritePoints(is: bool)
		magicView.rewritePoints(is: bool)
		sanityView.rewritePoints(is: bool)
		healthView.rewritePoints(is: bool)
	}
	
	func updatePointsValues(with points: [(current: Int, maximum: Int)]) {
		
		luckView.updatePointsDisplay(with: points[0])
		magicView.updatePointsDisplay(with: points[1])
		sanityView.updatePointsDisplay(with: points[2])
		healthView.updatePointsDisplay(with: points[3])
	}
	
	@objc func togglePointGroupEditMode() {
		
		if isEditModeEnabled {
			print("Points Group Edit Mode OFF")
			isEditModeEnabled = false
		} else {
			print("Points Group Edit Mode ON")
			isEditModeEnabled = true
		}
		
		luckView.toggleEditMode(as: isEditModeEnabled)
		magicView.toggleEditMode(as: isEditModeEnabled)
		sanityView.toggleEditMode(as: isEditModeEnabled)
		healthView.toggleEditMode(as: isEditModeEnabled)
	}
	
	// MARK: - Dice Roll Logic
	func getPointsRolled() -> IndvPointsView? {
		
		if luckView.hasDiceRolled {
			return luckView
		} else if sanityView.hasDiceRolled {
			return sanityView
		} else {
			return nil
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented, because will not be used on IB")
	}
}
