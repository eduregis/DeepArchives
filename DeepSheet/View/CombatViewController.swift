//
//  CombatViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class CombatViewController: UIViewController {
	
	lazy var attackCard: AttackCardView = {
		let attack = AttackCardView(attackName: "Revolver", chance: 25, dice: "1d4", reach: 20, num: 1, ammo: 5, malfunction: 15)
		attack.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(attack)
		return attack
	}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
			attackCard.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
			attackCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
			attackCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}
