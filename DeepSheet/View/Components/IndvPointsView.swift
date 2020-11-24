//
//  StatsPointsView.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 24/11/20.
//

import UIKit

class IndvPointsView: UIView {
	
	var isDiceEnabled: Bool = false
	
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
	
	lazy var pointBarIndicator: UIImageView = {
		let bar = UIImageView()
		var barColor = UIImage.imageWithColor(color: .shockingPink)
		bar.translatesAutoresizingMaskIntoConstraints = false
		bar.image = barColor
		self.addSubview(bar)
		return bar
	}()
	
	init(pointName: String, diceToggle: Bool, maxValue: Int) {
		super.init(frame: .zero)
		
		isDiceEnabled = diceToggle
		configureLayout()
		
		diceImage.image = UIImage(named: "d10-purple")
		pointLabel.text = pointName
		if maxValue > 999 {
			maxValueLabel.text = "/999"
		} else {
			maxValueLabel.text = "/\(maxValue)"
		}
	}
	
	override func draw(_ rect: CGRect) {
		self.layer.borderWidth = 3
		self.layer.cornerRadius = 5
		self.layer.borderColor = UIColor.palePurple.cgColor
		self.backgroundColor = .clear
	}
	
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
			
			maxValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			maxValueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15)
		])
			
		if isDiceEnabled {
			self.addSubview(diceImage)
			NSLayoutConstraint.activate([
				diceImage.topAnchor.constraint(equalTo: self.topAnchor),
				diceImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
				diceImage.widthAnchor.constraint(equalToConstant: 35),
				diceImage.heightAnchor.constraint(equalToConstant: 35),
				diceImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 110)
			])
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
