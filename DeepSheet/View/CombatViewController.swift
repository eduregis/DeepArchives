//
//  CombatViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class CombatViewController: UIViewController, CombatDelegate, UITextFieldDelegate {
	
	let investigator: Investigator
	let combatPresenter: CombatPresenter
	
	var generalCombat: [GeneralCombat] = []
	
	var items: [Item] = []
	
	var attacks: [Attack] = []
	
	init(_ inv: Investigator) {
		self.investigator = inv
		self.combatPresenter = CombatPresenter(self.investigator)
		
		//Change once Presenter can fetch from Aspects Model
		//self.generalCombat = combatPresenter.fetchGeneralCombat()
		self.generalCombat = combatPresenter.generalCombat
		
		self.items = combatPresenter.fetchItems()
		self.attacks = combatPresenter.fetchAttacks()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Components
    lazy var configButton: ConfigButton = {
        let cfgBtn = ConfigButton()
        cfgBtn.addTarget(self, action: #selector(goToConfigurations), for: .touchUpInside)
        return cfgBtn
    }()
    
    @objc func goToConfigurations() {
        let configScreen = ConfigViewController()
        self.navigationController?.pushViewController(configScreen, animated: true)
    }
	lazy var headerButtons: HeaderButtons = {
		let header = HeaderButtons()
		header.translatesAutoresizingMaskIntoConstraints = false
		header.editButton.addTarget(self, action: #selector(triggerGeneralModal), for: .touchUpInside)
		return header
	}()
	
	lazy var generalCombatView: GeneralCombatView = {
		let combat = GeneralCombatView(with: generalCombat[0])
		combat.translatesAutoresizingMaskIntoConstraints = false
		return combat
	}()
	
	lazy var attacksView: GroupAttackView = {
		let stack = GroupAttackView(with: attacks, and: self)
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var itemsView: GroupItemsView = {
		let stack = GroupItemsView(with: items)
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
    
	lazy var mainScrollingView: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
		scroll.showsVerticalScrollIndicator = false
		self.view.addSubview(scroll)
		return scroll
	}()
	
	lazy var dimmingOverlay: UIButton = {
		let dim = UIButton()
		dim.translatesAutoresizingMaskIntoConstraints = false
		dim.backgroundColor = .black
		dim.layer.opacity = 0
		dim.addTarget(self, action: #selector(self.dismissAlert), for: .touchUpInside)
		self.view.addSubview(dim)
		return dim
	}()
	
	lazy var diceAlert: DiceAlert = {
		let alert = DiceAlert(test: "", roll: "d100")
		alert.translatesAutoresizingMaskIntoConstraints = false
		alert.layer.backgroundColor = UIColor.backgroundBlack.cgColor
		alert.layer.opacity = 0
		alert.okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
		self.view.addSubview(alert)
		return alert
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		self.navigationController?.navigationBar.setNavigationBarStyle()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: configButton)

        
        generalCombatView.damageView.addTarget(self, action: #selector(triggerInfoDice(_ :)), for: .touchUpInside)
		generalCombatView.dodgeView.addTarget(self, action: #selector(triggerCharDice(_:)), for: .touchUpInside)
		
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
		
		self.attacksView.addButton.isUserInteractionEnabled = true
		let tapAttack = UITapGestureRecognizer(target: self, action: #selector(self.addAttackButton(_:)))
		tapAttack.numberOfTapsRequired = 1
		self.attacksView.addButton.addGestureRecognizer(tapAttack)
		
		self.itemsView.addButton.isUserInteractionEnabled = true
		let tapItem = UITapGestureRecognizer(target: self, action: #selector(self.addItemButton(_:)))
		tapItem.numberOfTapsRequired = 1
		self.itemsView.addButton.addGestureRecognizer(tapItem)
		
		setCombatDelegates()
		setTextFieldDelegates(with: self)
		connectEditAttack()
		connectEditItem()
        view.backgroundColor = .backgroundBlack
    }
    
	@objc func addAttackButton(_ sender: UITapGestureRecognizer) {
		self.present(NewWeaponModal(action: {
			self.fetchAttackData()
		}, self.combatPresenter), animated: true, completion: nil)
	}
	
	func fetchAttackData() {
		self.attacks = combatPresenter.fetchAttacks()
		attacksView.updateAttacks(with: attacks, and: self)
		setCombatDelegates()
		setTextFieldDelegates(with: self)
		connectEditAttack()
	}
	
	@objc func addItemButton(_ sender: UITapGestureRecognizer) {
		self.present(NewItemModal(action: {
			self.fetchItemData()
		}, self.combatPresenter), animated: true, completion: nil)
	}
	
	func fetchItemData() {
		self.items = combatPresenter.fetchItems()
		itemsView.updateItems(with: items)
		setTextFieldDelegates(with: self)
		connectEditItem()
	}
    
    private func configureLayout() {
		mainScrollingView.addSubview(generalCombatView)
		mainScrollingView.addSubview(headerButtons)
		mainScrollingView.addSubview(attacksView)
		mainScrollingView.addSubview(itemsView)
		
        NSLayoutConstraint.activate([
			mainScrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
			mainScrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			mainScrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			mainScrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
			
			generalCombatView.topAnchor.constraint(equalTo: mainScrollingView.topAnchor, constant: 0),
			generalCombatView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			generalCombatView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			headerButtons.topAnchor.constraint(equalTo: mainScrollingView.topAnchor, constant: 0),
			headerButtons.heightAnchor.constraint(equalToConstant: 34),
			headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			attacksView.topAnchor.constraint(equalTo: generalCombatView.bottomAnchor, constant: 30),
			attacksView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attacksView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			attacksView.bottomAnchor.constraint(equalTo: attacksView.topAnchor, constant: 400),
			
			dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
			dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            itemsView.topAnchor.constraint(equalTo: attacksView.bottomAnchor, constant: 30),
			itemsView.heightAnchor.constraint(equalToConstant: 400),
			itemsView.bottomAnchor.constraint(equalTo: mainScrollingView.bottomAnchor),
			itemsView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			itemsView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			
			diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
	
	@objc func backAction() {
		self.tabBarController?.navigationController?.popViewController(animated: true)
	}
	
	@objc func triggerGeneralModal() {
		self.present(EditCombatModal(action: {
			self.fetchGeneralCombat()
        }, self.generalCombat[0], self.combatPresenter), animated: true, completion: nil)
	}
	
	func fetchGeneralCombat() {
		self.generalCombat = combatPresenter.fetchGeneralCombat()
        generalCombatView.updateGeneralCombat(with: generalCombat[0])
	}
	
	// MARK: - Edit Attack Logic
	
	func connectEditAttack() {
		
		for attack in attacksView.attacksStack.arrangedSubviews {
			let actualAttack = attack as! AttackCardView
			actualAttack.editButton.addTarget(self, action: #selector(self.presentEditAttack(_:)), for: .touchUpInside)
		}
	}
	
	@objc func presentEditAttack(_ sender: UIButton) {
		
		let attackCard = sender.superview as! AttackCardView
		
		for attack in attacks {
			if attack.name == attackCard.attackLabel.text && attack.dice == attackCard.damageDiceValue {
				self.present(EditWeaponModal(action: {
					self.fetchAttackData()
				}, self.combatPresenter, attack), animated: true, completion: nil)
			}
		}
	}
	
	// MARK: - Edit Item Logic
	
	func connectEditItem() {
		
		for item in itemsView.itemStack.arrangedSubviews {
			let actualItem = item as! ItemCardView
			actualItem.itemUsesEditButton.addTarget(self, action: #selector(self.presentEditItem(_:)), for: .touchUpInside)
		}
	}
	
	@objc func presentEditItem(_ sender: UIButton) {
		
		let itemCard = sender.superview as! ItemCardView
		
		for item in items {
			if item.name == itemCard.itemNameLabel.text {
				self.present(EditItemModal(action: {
					self.fetchItemData()
				}, self.combatPresenter, item), animated: true, completion: nil)
			}
		}
	}
	
	// MARK: - Text Fields Logic
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField.superview is AttackCardView {
			
			let editedAttack = textField.superview as! AttackCardView
			updateAttackAmmo(with: editedAttack)
		} else if textField.superview is ItemCardView {
			
			let editedItem = textField.superview as! ItemCardView
			updateItemUses(with: editedItem)
		}
	}
	
	func updateAttackAmmo(with editedAttack: AttackCardView) {
		for att in attacks {
			if editedAttack.attackLabel.text == att.name && editedAttack.damageDiceValue == att.dice {
				combatPresenter.updateAttackAmmo(for: att, with: Int(editedAttack.ammoField.text!)!)
			}
		}
	}
	
	func updateItemUses(with editedItem: ItemCardView) {
		for it in items {
			if editedItem.itemNameLabel.text == it.name {
				combatPresenter.updateItemUses(for: it, with: Int(editedItem.itemUsesTextField.text!)!)
			}
		}
	}
	
	func setCombatDelegates() {
		attacksView.setAttacksDelegate(with: self)
	}
	
	func setTextFieldDelegates(with delegate: UITextFieldDelegate) {
		attacksView.setTextDelegates(with: delegate)
		itemsView.setTextDelegates(with: delegate)
	}
	
	// MARK: - Dice Roll Logic
	func triggerDice(diceText: String, diceType: String) {
		diceAlert.rollDice(rollText: diceText, rollType: diceType)
		
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 1
			self.dimmingOverlay.layer.opacity = 0.6
		})
	}
	
	func triggerDamageDice(attackName: String, diceType: String) {
		diceAlert.rollCustomDice(rollText: attackName ?? "", rollType: diceType ?? "")
		
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 1
			self.dimmingOverlay.layer.opacity = 0.6
		})
	}
    
    @objc func triggerInfoDice(_ sender: InfoView) {
        diceAlert.rollCustomDice(rollText: sender.characteristicLabel.text ?? "", rollType: sender.valueLabel.text ?? "")
        
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 1
            self.dimmingOverlay.layer.opacity = 0.6
        })
    }
	
	@objc func triggerCharDice(_ sender: CharacteristicView) {
		diceAlert.rollDice(rollText: LocalizedStrings.dodgeTitle, rollType: "d100")
		
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 1
			self.dimmingOverlay.layer.opacity = 0.6
		})
//
//		diceAlert.rollCustomDice(rollText: sender.characteristicLabel.text ?? "", rollType: sender.valueLabel.text ?? "")
//
//		UIView.animate(withDuration: 0.2, delay: 0, animations: {
//			self.diceAlert.layer.opacity = 1
//			self.dimmingOverlay.layer.opacity = 0.6
//		})
	}
	
	@objc func dismissAlert() {
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 0
			self.dimmingOverlay.layer.opacity = 0
		})
	}
}
