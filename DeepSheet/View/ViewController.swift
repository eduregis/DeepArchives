//
//  ViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

class ViewController: UIViewController {

    lazy var attributesInformation: AttributesView = {
        let attributes = AttributesView()
        attributes.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(attributes)
        return attributes
    }()
	
	lazy var pointsView: IndvPointsView = {
		let points = IndvPointsView(pointName: "SORTE", diceToggle: true)
		points.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(points)
		return points
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
            attributesInformation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
		
		NSLayoutConstraint.activate([
			pointsView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 440),
			pointsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			pointsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
		])
    }
}
