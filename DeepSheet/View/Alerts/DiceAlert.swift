//
//  DiceAlert.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 21/11/20.
//
import UIKit

protocol DiceProtocol {
    var testName: String { get set }
    var diceType: String { get set }
}

class DiceAlert: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
		label.text = LocalizedStrings.diceRollTitle
        return label
    }()
    
    lazy var testNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansDetail()
        label.textAlignment = .center
        label.textColor = .ivory
		label.text = LocalizedStrings.diceTestName
        return label
    }()
    
    lazy var diceTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansDetail()
        label.textAlignment = .center
        label.textColor = .ivory
		label.text = LocalizedStrings.diceRollName
        return label
    }()
    
    lazy var diceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    lazy var okButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = false
        button.contentMode = .scaleAspectFit
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = UIFont.josefinSansRegular()
        button.setTitleColor(.lightSeaGreen, for: .normal)
        self.addSubview(button)
        return button
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansResult()
        label.textAlignment = .center
        label.textColor = .ivory
        label.text = "55"
        return label
    }()
    
    lazy var upperDivisor: UIView = {
        let divisor = UIView()
        divisor.translatesAutoresizingMaskIntoConstraints = false
        divisor.backgroundColor = .lightSeaGreen
        self.addSubview(divisor)
        return divisor
    }()
    
    init(test: String, roll: String ) {
        super.init(frame: .zero)
        diceImage.image = UIImage(named: "d10-green")
        
		testNameLabel.text = LocalizedStrings.diceTestName + " \(test)"
		diceTypeLabel.text = LocalizedStrings.diceRollName + " \(roll)"
        
        let resultValue = Int.random(in: 1...100)
        resultLabel.text = "\(resultValue)"
        
        configureLayout()
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightSeaGreen.cgColor
    }
    
    func rollDice (rollText: String, rollType: String) {
        
        testNameLabel.text = rollText
        diceTypeLabel.text = LocalizedStrings.diceRollName + " \(rollType)"
        
        let resultValue = Int.random(in: 1...100)
        resultLabel.text = "\(resultValue)"
        
    }
    
    func rollCustomDice (rollText: String, rollType: String) {
        
        testNameLabel.text = rollText
        
        let values = rollType.split(separator: "+")
        var finalValue = 0
        
        for value in values {
            let str = (String(value).trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
            let subValues = str.split(separator: "d")
            if subValues.count > 1 {
                let rollTimes = Int(subValues[0])
                var rollResult = Int(subValues[1])
                rollResult = Int.random(in: 1...rollResult!)
                finalValue += (rollTimes! * rollResult!)
            } else {
                let rollTimes = Int(subValues[0])
                finalValue + (rollTimes!)
            }
        }
        
        diceTypeLabel.text = LocalizedStrings.diceRollName + " \(rollType)"
        
        resultLabel.text = "\(finalValue)"
        
    }
    
    func updateFonts(value: UIFont, characteristic: UIFont) {
//        valueLabel.font = characteristic
//        characteristicLabel.font = value
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 317),
            self.widthAnchor.constraint(equalToConstant: 268),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            testNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            testNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            diceTypeLabel.topAnchor.constraint(equalTo: testNameLabel.bottomAnchor, constant: 15),
            diceTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            diceImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            diceImage.topAnchor.constraint(equalTo: diceTypeLabel.bottomAnchor),
            diceImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
            diceImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45),
            
            resultLabel.centerXAnchor.constraint(equalTo: diceImage.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: diceImage.centerYAnchor),
            
            upperDivisor.widthAnchor.constraint(equalTo: self.widthAnchor),
            upperDivisor.heightAnchor.constraint(equalToConstant: 3),
            upperDivisor.bottomAnchor.constraint(equalTo: okButton.topAnchor),
            upperDivisor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            okButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            okButton.widthAnchor.constraint(equalTo: self.widthAnchor),
            okButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
}
