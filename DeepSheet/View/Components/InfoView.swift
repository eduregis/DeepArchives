//
//  InfoView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 24/11/20.
//
import UIKit

class InfoView: UIButton {
    	
    lazy var characteristicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
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
    
    init(characteristic: String, value: String, preValue: String = "") {
        super.init(frame: .zero)
		
        configureLayout()
        characteristicLabel.text = characteristic
        
        valueLabel.text = preValue + "\(value)"
        
        valueTextField.text = "\(value)"
        
        valueTextField.isHidden = true
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
            
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -3),
            
            valueTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -3)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
}
