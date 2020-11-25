//
//  AspectsViewController.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 25/11/20.
//

import UIKit

class AspectsViewController: UIViewController {

	lazy var attributesInformation: AttributesView = {
		let attributes = AttributesView()
		attributes.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(attributes)
		return attributes
	}()
	
	lazy var statesView: GroupStatesView = {
		let states = GroupStatesView()
		states.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(states)
		return states
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		additionalConfigurations()
	}
	
	private func additionalConfigurations() {
		configureLayout()
		//Change background color
		view.backgroundColor = .backgroundBlack
		//Navigation configuration
	}
	
	private func configureLayout() {
		NSLayoutConstraint.activate([
			attributesInformation.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
			attributesInformation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attributesInformation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			statesView.topAnchor.constraint(equalTo: attributesInformation.bottomAnchor, constant: 55),
			statesView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			statesView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
		])
	}
}
