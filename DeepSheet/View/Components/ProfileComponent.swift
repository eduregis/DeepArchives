//
//  ProfileComponent.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 02/12/20.
//

import UIKit

class ProfileComponent: UIView {
    
    var isMultiline: Bool = false
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .backgroundBlack
        label.font = UIFont.josefinSansBold17()
        return label
    }()
    
    lazy var valueText: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 17.0)
        field.backgroundColor = .backgroundBlack
        field.textColor = .ivory
        field.isEditable = false
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.textContainer.lineBreakMode = .byWordWrapping
        field.textContainerInset = UIEdgeInsets(top: 3, left: 10, bottom: 0, right: 10)
        return field
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, valueText])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 5
        self.addSubview(stack)
        return stack
    }()
    
    init(titleText: String, value: String, multiline: Bool = false) {
        super.init(frame: .zero)
        titleLabel.text = titleText
        valueText.text = value
        self.isMultiline = multiline
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor.lightSeaGreen.cgColor
        self.layer.borderColor = UIColor.lightSeaGreen.cgColor
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: stack.topAnchor, constant: 10),
            
            valueText.leadingAnchor.constraint(equalTo: stack.leadingAnchor)
        ])
        
        if isMultiline {
            valueText.heightAnchor.constraint(equalToConstant: 90).isActive = true
            valueText.textContainer.maximumNumberOfLines = 10
        } else {
            valueText.heightAnchor.constraint(equalToConstant: 30).isActive = true
            valueText.textContainer.maximumNumberOfLines = 1
        }
    }
}
