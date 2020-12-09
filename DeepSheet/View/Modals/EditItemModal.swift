//
//  EditItemModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 30/11/20.
//

import UIKit

class EditItemModal: UIViewController {
    
	let combatPresenter: CombatPresenter
	
	var editingAction: (() -> Void)?
	
	var editItem: Item
	
	init(action: @escaping () -> Void, _ presenter: CombatPresenter, _ editItem: Item) {
		self.combatPresenter = presenter
		self.editItem = editItem
		super.init(nibName: nil, bundle: nil)
		editingAction = action
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    // MARK: - NavBar
    
    lazy var navigationBar: UIView = {
        let bar = UIView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = .black
        self.view.addSubview(bar)
        return bar
    }()
    
    lazy var titleModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .ivory
        label.text = LocalizedStrings.editItemName
        label.font = UIFont.josefinSansButton()
        self.view.addSubview(label)
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedStrings.cancelButton, for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        self.view.addSubview(button)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedStrings.confirmButton, for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        self.view.addSubview(button)
        return button
    }()
    
    // MARK: - First Group
    
    lazy var itemNameView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.itemName)
        return view
    }()

    lazy var useView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.uses)
        return view
    }()
    
    lazy var descriptionView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.description, multiline: true)
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemNameView, useView, descriptionView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        additionalConfigurations()
		
		itemNameView.valueText.text = editItem.name
		useView.valueText.text = "\(editItem.uses)"
		descriptionView.valueText.text = editItem.descript
		
        leftButton.addTarget(self, action: #selector(leftButtonBehavior), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonBehavior), for: .touchUpInside)
    }
    
    @objc func leftButtonBehavior() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func rightButtonBehavior() {
		editItem(item: editItem)
        dismiss(animated: true, completion: editingAction)
    }
	
	private func editItem(item: Item) {
		combatPresenter.updateItem(for: item, newName: itemNameView.valueText.text, newUses: Int(useView.valueText.text)!, newDescription: descriptionView.valueText.text)
	}
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 55),
            navigationBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            titleModal.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            titleModal.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            
            leftButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            leftButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            
            rightButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            rightButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
        
            stack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}
