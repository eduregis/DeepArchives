//
//  ItemCardView.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 06/12/20.
//

import UIKit

class ItemCardView: UIView {

    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .backgroundBlack
        label.font = UIFont.josefinSansBold17()
        return label
    }()
    
    lazy var itemDescriptionTextView: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 17.0)
        field.textColor = .ivory
        field.backgroundColor = .backgroundBlack
        field.isEditable = false
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.textContainer.lineBreakMode = .byWordWrapping
        field.textContainerInset = UIEdgeInsets(top: 3, left: 10, bottom: 0, right: 10)
        return field
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemNameLabel, itemDescriptionTextView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    lazy var itemUsesEditButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .backgroundBlack
        self.addSubview(button)
        return button
    }()
    
    lazy var itemUsesBackground: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let color = UIImage.imageWithColor(color: .backgroundBlack)
        view.image = color
        self.addSubview(view)
        return view
    }()
    
    lazy var itemUsesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.josefinSansBold17()
        label.textAlignment = .center
        label.textColor = .ivory
        label.backgroundColor = .clear
        label.text = "Usos:"
        self.addSubview(label)
        return label
    }()
    
    lazy var itemUsesTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(field)
        field.font = UIFont.josefinSansBold17()
		field.textColor = .backgroundBlack
		field.backgroundColor = .ivory
        field.textAlignment = .center
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.keyboardType = .numberPad
        return field
    }()
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor.lightSeaGreen.cgColor
        self.layer.borderColor = UIColor.lightSeaGreen.cgColor
    }
  
	init(itemName: String, itemDescription: String, itemUses: Int) {
		
        super.init(frame: .zero)
        configureLayout()
		
		itemNameLabel.text = itemName
		itemDescriptionTextView.text = itemDescription
		itemUsesTextField.text = "\(itemUses)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        self.sendSubviewToBack(itemUsesBackground)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 125),
            
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            itemNameLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 16),
            itemNameLabel.topAnchor.constraint(equalTo: stack.topAnchor, constant: 15),
            
            itemUsesEditButton.trailingAnchor.constraint(equalTo: itemUsesBackground.leadingAnchor, constant: -10),
            itemUsesEditButton.centerYAnchor.constraint(equalTo: itemUsesBackground.centerYAnchor),

            itemUsesBackground.leadingAnchor.constraint(equalTo: itemUsesLabel.leadingAnchor, constant: -5),
            itemUsesBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemUsesBackground.heightAnchor.constraint(equalToConstant: 44),
       
            itemUsesLabel.trailingAnchor.constraint(equalTo: itemUsesTextField.leadingAnchor, constant: -10),
            itemUsesLabel.centerYAnchor.constraint(equalTo: itemUsesBackground.centerYAnchor),
            
            itemUsesTextField.trailingAnchor.constraint(equalTo: itemUsesBackground.trailingAnchor, constant: -10),
            itemUsesTextField.centerYAnchor.constraint(equalTo: itemUsesBackground.centerYAnchor),
            itemUsesTextField.widthAnchor.constraint(equalToConstant: 32),
            itemUsesTextField.heightAnchor.constraint(equalToConstant: 20),
            
            itemDescriptionTextView.leadingAnchor.constraint(equalTo: stack.leadingAnchor)
        ])
    }
}
