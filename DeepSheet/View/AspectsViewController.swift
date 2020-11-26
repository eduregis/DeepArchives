//
//  AspectsViewController.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 25/11/20.
//
import UIKit

class AspectsViewController: UIViewController, AspectsViewDelegate {

	private let aspectsViewPresenter = AspectsPresenter()
	
	lazy var headerButtons: HeaderButtons = {
		let header = HeaderButtons()
		header.editButton.addTarget(self, action: #selector(self.enterEditing), for: .touchUpInside)
		header.cancelButton.addTarget(self, action: #selector(self.cancelEditing), for: .touchUpInside)
		header.confirmButton.addTarget(self, action: #selector(self.confirmEditing), for: .touchUpInside)
		header.translatesAutoresizingMaskIntoConstraints = false
		return header
	}()
	
	lazy var attributesInformation: AttributesView = {
		let attributes = AttributesView()
		attributes.translatesAutoresizingMaskIntoConstraints = false
		return attributes
	}()
	
	lazy var pointsView: GroupPointsView = {
		let points = GroupPointsView()
		points.translatesAutoresizingMaskIntoConstraints = false
		return points
	}()

	lazy var statesView: GroupStatesView = {
		let states = GroupStatesView()
		states.translatesAutoresizingMaskIntoConstraints = false
		return states
	}()
	
	lazy var scrollingView: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
		scroll.isScrollEnabled = true
		scroll.alwaysBounceVertical = false
		self.view.addSubview(scroll)
		return scroll
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		additionalConfigurations()
	}
	
	private func additionalConfigurations() {
		aspectsViewPresenter.setAspectsDelegate(viewDelegate: self)
		configureLayout()
		
		let placeholderPoints = [
			(111, 111),
			(222, 222),
			(333, 333),
			(444, 444)
		]
		pointsView.updatePointsValues(with: placeholderPoints)
		
		view.backgroundColor = .backgroundBlack
		
	}
	
	private func configureLayout() {
		scrollingView.addSubview(headerButtons)
		scrollingView.addSubview(attributesInformation)
		scrollingView.addSubview(pointsView)
		scrollingView.addSubview(statesView)
		
		NSLayoutConstraint.activate([
			scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
			scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
			
			headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
			headerButtons.heightAnchor.constraint(equalToConstant: 34),
			headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			attributesInformation.topAnchor.constraint(equalTo: headerButtons.bottomAnchor, constant: 10),
			attributesInformation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attributesInformation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
		
			pointsView.topAnchor.constraint(equalTo: attributesInformation.bottomAnchor, constant: 55),
			pointsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			pointsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			
			statesView.topAnchor.constraint(equalTo: pointsView.bottomAnchor, constant: 55),
			statesView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			statesView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			statesView.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor, constant: 0)
		])
	}
	
	// MARK: - Logic
	@objc func enterEditing() {
		headerButtons.enterEditing()
		attributesInformation.groupIsEditable(is: true)
		pointsView.togglePointGroupEditMode()
	}
	
	@objc func cancelEditing() {
		headerButtons.endEditing()
		attributesInformation.groupIsEditable(is: false)
		pointsView.togglePointGroupEditMode()
	}
	
	@objc func confirmEditing() {
		headerButtons.endEditing()
		attributesInformation.groupIsEditable(is: false)
		pointsView.confirmEdit()
	}
}
