//
//  GroupPointsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class GroupPointsView: UIView {
	
	var isEditModeEnabled: Bool = false
	var isEditConfirmed: Bool = false
	
	// MARK: - Components
	lazy var luckView: IndvPointsView = {
		let points = IndvPointsView(pointName: LocalizedStrings.luckPoints, diceButton: true)
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
		let points = IndvPointsView(pointName: LocalizedStrings.sanityPoints, diceButton: true)
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
	
	// MARK: - Logic
	
	func updatePointsValues(with points: [(current: Int, maximum: Int)]) {
		
		luckView.updatePointsDisplay(with: points[0])
		magicView.updatePointsDisplay(with: points[1])
		sanityView.updatePointsDisplay(with: points[2])
		healthView.updatePointsDisplay(with: points[3])
	}
	
	//Presenter call when Confirm edit, DO NOT call when Cancelling
	@objc func confirmEdit() {
		if isEditModeEnabled {
			isEditConfirmed = true
			togglePointGroupEditMode()
		}
	}
	
	@objc func togglePointGroupEditMode() {
		
		if isEditModeEnabled {
			print("Points Group Edit Mode OFF")
			isEditModeEnabled = false
			//editTest.isHidden = true
		} else {
			print("Points Group Edit Mode ON")
			isEditModeEnabled = true
			//editTest.isHidden = false
		}
		
		luckView.toggleEditMode(as: isEditModeEnabled, confirm: isEditConfirmed)
		magicView.toggleEditMode(as: isEditModeEnabled, confirm: isEditConfirmed)
		sanityView.toggleEditMode(as: isEditModeEnabled, confirm: isEditConfirmed)
		healthView.toggleEditMode(as: isEditModeEnabled, confirm: isEditConfirmed)
		
		if isEditConfirmed {
			isEditConfirmed = false
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented, because will not be used on IB")
	}
}
