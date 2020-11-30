//
//  EditModalStackComponent.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 27/11/20.
//

import UIKit

class EditModalComponent: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .ivory
        label.font = UIFont.josefinSansBold()
        return label
    }()
    
    lazy var valueText: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.josefinSansRegular()
        field.textColor = .backgroundBlack
        field.backgroundColor = .ivory
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.systemGray3.cgColor
        return field
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, valueText])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    init(titleText: String) {
        super.init(frame: .zero)
        titleLabel.text = titleText
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
