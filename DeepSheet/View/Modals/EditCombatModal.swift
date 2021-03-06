//
//  EditCombatModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 30/11/20.
//

import UIKit

class EditCombatModal: UIViewController {
    
    let generalCombat: GeneralCombat
    
	let combatPresenter: CombatPresenter
	
	var editingAction: (() -> Void)?
	
    init(action: @escaping () -> Void, _ generalCombatReceived: GeneralCombat, _ presenter: CombatPresenter) {
        self.generalCombat = generalCombatReceived
		self.combatPresenter = presenter
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
        label.text = LocalizedStrings.editCombatName
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
    
    lazy var damageView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.damage)
        return view
    }()
    
    lazy var damageDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkIvory
        label.font = UIFont.josefinSansRegular()
        label.text = LocalizedStrings.damageDetail
        label.numberOfLines = 0

        return label
    }()
    
    lazy var damageStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [damageView, damageDetail])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        self.view.addSubview(stack)
        return stack
    }()
    
    lazy var dodgeView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.dodge)
        return view
    }()
    
    lazy var dodgeDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkIvory
        label.font = UIFont.josefinSansRegular()
        label.numberOfLines = 0
        label.numberOfLines = 0
        label.isHidden = true
        label.text = "Percentage out of range."
        label.textColor = .systemRed
        return label
    }()
    
    lazy var dodgeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dodgeView, dodgeDetail])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        self.view.addSubview(stack)
        return stack
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [damageStack, dodgeStack])
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
        leftButton.addTarget(self, action: #selector(leftButtonBehavior), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonBehavior), for: .touchUpInside)
        
        damageView.valueText.text = generalCombat.damageBonus
        dodgeView.valueText.text = String(generalCombat.dodgeValue)
    }
    
    @objc func leftButtonBehavior() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func rightButtonBehavior() {
        if BusinessRules.checkIfIsPercentageValue(Int64(dodgeView.valueText.text)!) {
            if BusinessRules.checkIfIsDicesIsValid(damageView.valueText.text) {
                combatPresenter.editGeneralCombat(newDamage: damageView.valueText.text, newDodge: Int(dodgeView.valueText.text)!)
                dismiss(animated: true, completion: editingAction)
            } else {
                damageDetail.textColor = .systemRed
                damageDetail.shake(count: 4, for: 0.2, withTranslation: 3)
            }
            dodgeDetail.isHidden = true
        } else {
            dodgeDetail.isHidden = false
            dodgeDetail.shake(count: 4, for: 0.2, withTranslation: 3)
        }
        
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
