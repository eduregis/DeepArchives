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
    
//    lazy var characterIllustration: IllustrationView =  {
//        let illustration = IllustrationView(image: UIImage(named: "d10-green")!)
//        illustration.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(illustration)
//        return illustration
//    }()
    
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
        beNotEditable()
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
        
        headerButtons.cancelButton.addTarget(self, action: #selector(beNotEditable), for: .touchUpInside)
        headerButtons.confirmButton.addTarget(self, action: #selector(beNotEditable), for: .touchUpInside)
        headerButtons.editButton.addTarget(self, action: #selector(beEditable), for: .touchUpInside)
        
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
    
    @objc func beEditable() {
        headerButtons.cancelButton.isHidden = false
        headerButtons.confirmButton.isHidden = false
        headerButtons.editButton.isHidden = true
        
        attributesInformation.strView.beEditable()
        attributesInformation.dexView.beEditable()
        attributesInformation.intView.beEditable()
        attributesInformation.conView.beEditable()
        attributesInformation.appView.beEditable()
        attributesInformation.powView.beEditable()
        attributesInformation.sizView.beEditable()
        attributesInformation.eduView.beEditable()
        attributesInformation.movView.beEditable()
    }
    
    @objc func beNotEditable() {
        headerButtons.cancelButton.isHidden = true
        headerButtons.confirmButton.isHidden = true
        headerButtons.editButton.isHidden = false
        
        attributesInformation.strView.beNotEditable()
        attributesInformation.dexView.beNotEditable()
        attributesInformation.intView.beNotEditable()
        attributesInformation.conView.beNotEditable()
        attributesInformation.appView.beNotEditable()
        attributesInformation.powView.beNotEditable()
        attributesInformation.sizView.beNotEditable()
        attributesInformation.eduView.beNotEditable()
        attributesInformation.movView.beNotEditable()
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
            
            attributesInformation.topAnchor.constraint(equalTo: self.generalCombat.bottomAnchor, constant: 32),
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
