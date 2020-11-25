//
//  CharacteristicView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

class CharacteristicView: UIButton {
    
    lazy var characteristicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
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
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .lightSeaGreen
        return label
    }()
    
    lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textField)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.josefinSansBold()
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    lazy var valueBy2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansRegular()
        label.textAlignment = .center
        label.textColor = .ivory
        label.backgroundColor = .darkSeaGreen
        return label
    }()
    
    lazy var valueBy5Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansRegular()
        label.textAlignment = .center
        label.textColor = .ivory
        label.backgroundColor = .darkSeaGreen
        return label
    }()
    
    lazy var upperDivisor: UIView = {
        let divisor = UIView()
        divisor.translatesAutoresizingMaskIntoConstraints = false
        divisor.backgroundColor = .lightSeaGreen
        self.addSubview(divisor)
        return divisor
    }()
    
    lazy var middleDivisor: UIView = {
        let divisor = UIView()
        divisor.translatesAutoresizingMaskIntoConstraints = false
        divisor.backgroundColor = .lightSeaGreen
        self.addSubview(divisor)
        return divisor
    }()
    
    init(characteristic: String, value: Int, preValue: String = "", valueBy2: String? = nil, valueBy5: String? = nil) {
        super.init(frame: .zero)
        configureLayout()
        characteristicLabel.text = characteristic
        
        diceImage.image = UIImage(named: "d10-green")
        
        valueLabel.text = preValue + "\(value)"
        
        valueTextField.text = "\(value)"
        
        valueTextField.isHidden = true
        
        if let valueBy2Text = valueBy2 {
            valueBy2Label.text = valueBy2Text
        } else {
            valueBy2Label.text = "\(Int(value/2))"
        }
        
        if let valueBy5Text = valueBy5 {
            valueBy5Label.text = valueBy5Text
        } else {
            valueBy5Label.text = "\(Int(value/5))"
        }

    }
    
    func beEditable() {
        isEnabled = false
        valueTextField.isHidden = false
    }
    
    func beNotEditable() {
        isEnabled = true
        valueTextField.isHidden = true
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightSeaGreen.cgColor
        self.backgroundColor = .clear
    }
    
    func updateFonts(value: UIFont, characteristic: UIFont) {
        valueLabel.font = characteristic
        characteristicLabel.font = value
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 117),
            
            characteristicLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            characteristicLabel.bottomAnchor.constraint(equalTo: valueLabel.topAnchor, constant: -9),
            characteristicLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            diceImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            diceImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -3),
            diceImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
            diceImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45),
            
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -3),
            
            valueTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -3),
            
            valueBy2Label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            valueBy2Label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            valueBy2Label.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 2),
            valueBy2Label.heightAnchor.constraint(equalToConstant: 32),
            
            valueBy5Label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            valueBy5Label.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: -2),
            valueBy5Label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            valueBy5Label.heightAnchor.constraint(equalToConstant: 32),
            
            upperDivisor.widthAnchor.constraint(equalTo: self.widthAnchor),
            upperDivisor.heightAnchor.constraint(equalToConstant: 3),
            upperDivisor.bottomAnchor.constraint(equalTo: valueBy2Label.topAnchor),
            upperDivisor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            middleDivisor.widthAnchor.constraint(equalToConstant: 3),
            middleDivisor.heightAnchor.constraint(equalTo: valueBy2Label.heightAnchor),
            middleDivisor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            middleDivisor.centerYAnchor.constraint(equalTo: valueBy2Label.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
}
