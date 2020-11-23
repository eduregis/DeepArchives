//
//  ViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

class ViewController: UIViewController {

    lazy var attributesInformation: AttributesView = {
        let attributes = AttributesView()
        attributes.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(attributes)
        return attributes
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
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
        diceAlert.okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        dimmingOverlay.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        attributesInformation.strView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.dexView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.intView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.conView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.appView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.powView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.sizView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.eduView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
        attributesInformation.movView.addTarget(self, action: #selector(triggerAlert), for: .touchUpInside)
    }
    
    @objc func dismissAlert() {
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 0
            self.dimmingOverlay.layer.opacity = 0
        })
    }
    
    @objc func triggerAlert(sender: UIButton) {
        print(sender.tag)
        diceAlert.rollDice(tag: sender.tag)
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 1
            self.dimmingOverlay.layer.opacity = 0.6
        })
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            attributesInformation.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32),
            attributesInformation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            attributesInformation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
