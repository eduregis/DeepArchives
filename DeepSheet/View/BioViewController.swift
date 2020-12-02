//
//  BioViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 25/11/20.
//
import UIKit

class BioViewController: UIViewController {
    
    lazy var headerButtons: HeaderButtons = {
        let header = HeaderButtons()
        header.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(header)
        return header
    }()
    
    lazy var generalCombat: GeneralCombatView = {
        let header = GeneralCombatView()
        header.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(header)
        return header
    }()
    
    lazy var dimmingOverlay: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0
        self.view.addSubview(view)
        return view
    }()
    
    lazy var diceAlert: DiceAlert = {
        let alert = DiceAlert(test: "Destreza (Atributo)", roll: "d100")
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.layer.backgroundColor = UIColor.backgroundBlack.cgColor
        alert.layer.opacity = 0
        self.view.addSubview(alert)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelEdit()
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
        
        headerButtons.cancelButton.addTarget(self, action: #selector(cancelEdit), for: .touchUpInside)
        headerButtons.confirmButton.addTarget(self, action: #selector(confirmEdit), for: .touchUpInside)
        headerButtons.editButton.addTarget(self, action: #selector(enterEdit), for: .touchUpInside)
        
        diceAlert.okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        dimmingOverlay.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
    }
    
    @objc func dismissAlert() {
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 0
            self.dimmingOverlay.layer.opacity = 0
        })
    }
    
    @objc func triggerAlert(sender: CharacteristicView) {
        print(sender.diceType)
        diceAlert.rollDice(rollText: sender.testName, rollType: sender.diceType)
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 1
            self.dimmingOverlay.layer.opacity = 0.6
        })
    }
    
    @objc func enterEdit() {
		headerButtons.enterEditing()
        
    }
    
    @objc func cancelEdit() {
		headerButtons.endEditing()
        
    }
	
	@objc func confirmEdit() {
		headerButtons.endEditing()
		
	}
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            headerButtons.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            headerButtons.heightAnchor.constraint(equalToConstant: 34),
            headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
//            characterIllustration.topAnchor.constraint(equalTo: headerButtons.bottomAnchor),
//            characterIllustration.heightAnchor.constraint(equalToConstant: 240),
//            characterIllustration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            generalCombat.topAnchor.constraint(equalTo: headerButtons.bottomAnchor),
            generalCombat.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            generalCombat.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
