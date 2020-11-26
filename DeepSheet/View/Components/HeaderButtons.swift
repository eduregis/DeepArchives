//
//  HeaderButtons.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 24/11/20.
//

import UIKit

class HeaderButtons: UIView {
    
	var isEditingEnabled: Bool = false
	
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.ivory, for: .normal)
        self.addSubview(button)
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.ivory, for: .normal)
        self.addSubview(button)
        return button
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar", for: .normal)
        button.setTitleColor(.ivory, for: .normal)
        self.addSubview(button)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configureLayout()
		toggleEditMode(as: isEditingEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on a storyboard")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //This will make the view rounded
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            //Round View Constraints
            cancelButton.topAnchor.constraint(equalTo: self.topAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: self.topAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            editButton.topAnchor.constraint(equalTo: self.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
	
	func toggleEditMode(as toggle: Bool) {
		if toggle {
			isEditingEnabled = true
			
			editButton.isHidden = true
			confirmButton.isHidden = false
			cancelButton.isHidden = false
		} else {
			isEditingEnabled = false
			
			editButton.isHidden = false
			confirmButton.isHidden = true
			cancelButton.isHidden = true
		}
	}

}
