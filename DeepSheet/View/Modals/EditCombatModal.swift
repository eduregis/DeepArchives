//
//  EditCombatModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 30/11/20.
//

import UIKit

class EditCombatModal: UIViewController {
    
    var actualPage = 0
    var lastPage = 0
    
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
        label.text = "Editar Perfil"
        label.font = UIFont.josefinSansButton()
        self.view.addSubview(label)
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        button.setTitle("Cancelar", for: .normal)
        self.view.addSubview(button)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        button.setTitle("Confirmar", for: .normal)
        self.view.addSubview(button)
        return button
    }()
    
    // MARK: - First Group
    
    lazy var damageView: EditModalComponent = {
        let view = EditModalComponent(titleText: "Dano")
        return view
    }()
    
    lazy var damageDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkIvory
        label.font = UIFont.josefinSansRegular()
        label.text = "Insira uma combinação válida de dados. Ex: 1d6 + 1d3, 1d4"
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
        let view = EditModalComponent(titleText: "Esquiva")
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [damageStack, dodgeView])
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
    }
    
    @objc func leftButtonBehavior() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func rightButtonBehavior() {
        dismiss(animated: true, completion: nil)
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
            stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
    }
}
