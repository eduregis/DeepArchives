//
//  CombatViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class CombatViewController: UIViewController, CombatDelegate {
	
	lazy var headerButtons: HeaderButtons = {
		let header = HeaderButtons()
		header.translatesAutoresizingMaskIntoConstraints = false
		header.editButton.addTarget(self, action: #selector(triggerGeneralModal), for: .touchUpInside)
		return header
	}()
	
	lazy var generalCombat: GeneralCombatView = {
		let combat = GeneralCombatView()
		combat.translatesAutoresizingMaskIntoConstraints = false
		return combat
	}()
	
	lazy var attackCard: AttackCardView = {
		let attack = AttackCardView(attackName: "Revolver", chance: 25, dice: "1d4", reach: 20, num: 1, ammo: 5, malfunction: 15)
		attack.translatesAutoresizingMaskIntoConstraints = false
		return attack
	}()
    
	lazy var scrollingView: UIScrollView = {
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
		
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
		
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
		setCombatDelegates()
        view.backgroundColor = .backgroundBlack
    }
    
    private func configureLayout() {
		scrollingView.addSubview(generalCombat)
		scrollingView.addSubview(headerButtons)
		scrollingView.addSubview(attackCard)
		
        NSLayoutConstraint.activate([
			scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
			scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
			scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
			scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
			
			generalCombat.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
			generalCombat.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			generalCombat.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
			headerButtons.heightAnchor.constraint(equalToConstant: 34),
			headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			
			attackCard.topAnchor.constraint(equalTo: generalCombat.bottomAnchor, constant: 10),
			attackCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attackCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			attackCard.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor, constant: -10),
			
			dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
			dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			
			diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
	
	@objc func backAction() {
		self.tabBarController?.navigationController?.popViewController(animated: true)
	}
	
	@objc func triggerGeneralModal() {
		let editModal = EditCombatModal()
		present(editModal, animated: true, completion: nil)
	}
	
	// MARK: - Dice Roll Logic
	func setCombatDelegates() {
		attackCard.setCombatDelegate(with: self)
	}
	
	func triggerDice(diceText: String, diceType: String) {
		diceAlert.rollDice(rollText: diceText, rollType: diceType)
		
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 1
			self.dimmingOverlay.layer.opacity = 0.6
		})
		
		print("Presented attack with \(diceText)")
	}
	
	@objc func dismissAlert() {
		UIView.animate(withDuration: 0.2, delay: 0, animations: {
			self.diceAlert.layer.opacity = 0
			self.dimmingOverlay.layer.opacity = 0
		})
	}
}
