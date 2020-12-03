//
//  CombatViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class CombatViewController: UIViewController {
	
	lazy var headerButtons: HeaderButtons = {
		let header = HeaderButtons()
		header.translatesAutoresizingMaskIntoConstraints = false
		header.editButton.addTarget(self, action: #selector(triggerModal), for: .touchUpInside)
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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
	
	@objc func triggerModal () {
		let editModal = EditCombatModal()
		present(editModal, animated: true, completion: nil)
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
			attackCard.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor, constant: -10)
        ])
    }
	
}
