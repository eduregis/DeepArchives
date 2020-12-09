//
//  NewWeaponModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 30/11/20.
//

import UIKit

class NewWeaponModal: UIViewController {
    
	let combatPresenter: CombatPresenter
	
	var editingAction: (() -> Void)?
	
    var actualPage = 0
    var lastPage = 2
	
	init(action: @escaping () -> Void, _ presenter: CombatPresenter) {
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
        label.text = LocalizedStrings.newWeaponName
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
    
    lazy var weaponNameView: EditModalComponent = {
        let stack = EditModalComponent(titleText: LocalizedStrings.investigatorName)
        return stack
    }()
    
    lazy var pointsView: EditModalComponent = {
        let stack = EditModalComponent(titleText: LocalizedStrings.points)
        return stack
    }()
    
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
    
    lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [weaponNameView, pointsView, damageStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Second Group
    
    lazy var malfunctionView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.malfunction)
        return view
    }()
    
    lazy var rangeView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.range)
        return view
    }()
    
    lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [malfunctionView, rangeView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Third Group
    
    lazy var ammoView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.ammo)
        return view
    }()
    
    lazy var attackView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.attacks)
        return view
    }()
    
    lazy var thirdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ammoView, attackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
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
        
        firstStack.isHidden = false
        secondStack.isHidden = true
        thirdStack.isHidden = true
    }
    
    @objc func leftButtonBehavior() {
        if actualPage == 0 {
            dismiss(animated: true, completion: nil)
        } else {
            actualPage -= 1
        }
        atualizeUI()
    }
    
    @objc func rightButtonBehavior() {
		var valueChecks = false
		
		if actualPage == lastPage && BusinessRules.checkIfIsPercentageValue(Int64(pointsView.valueText.text)!) {
			if BusinessRules.checkIfIsPercentageValue(Int64(malfunctionView.valueText.text)!) {
				valueChecks = true
			}
		}
		
		if actualPage == lastPage && valueChecks {
			createNewAttack()
            dismiss(animated: true, completion: editingAction)
        } else {
            actualPage += 1
        }
        atualizeUI()
    }
	
	private func createNewAttack() {
		combatPresenter.newAttack(attackName: weaponNameView.valueText.text, chance: Int(pointsView.valueText.text)!, dice: damageView.valueText.text, reach: Int(rangeView.valueText.text)!, num: Int(attackView.valueText.text)!, ammo: Int(ammoView.valueText.text)!, malfunction: Int(malfunctionView.valueText.text)!)
	}
    
    func atualizeUI() {
        if actualPage == 0 {
            leftButton.setTitle(LocalizedStrings.cancelButton, for: .normal)
        } else {
            leftButton.setTitle(LocalizedStrings.backButton, for: .normal)
        }
        
        if actualPage == lastPage {
            rightButton.setTitle(LocalizedStrings.confirmButton, for: .normal)
        } else {
            rightButton.setTitle(LocalizedStrings.nextButton, for: .normal)
        }
        
        switch actualPage {
        case 0:
            firstStack.isHidden = false
            secondStack.isHidden = true
            thirdStack.isHidden = true
        case 1:
            firstStack.isHidden = true
            secondStack.isHidden = false
            thirdStack.isHidden = true
        case 2:
            firstStack.isHidden = true
            secondStack.isHidden = true
            thirdStack.isHidden = false
        default:
            break
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
            
            firstStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            firstStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            firstStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),

            secondStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            secondStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            secondStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            thirdStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            thirdStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            thirdStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}
