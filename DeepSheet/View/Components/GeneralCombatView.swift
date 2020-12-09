//
//  GeneralCombatView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 24/11/20.
//

import UIKit

class GeneralCombatView: UIView {
    
    // MARK: - Título
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
        label.text = "Geral"
        return label
    }()
    
    // MARK: - Primeira linha
    let damageView: InfoView = {
        let view = InfoView(characteristic: LocalizedStrings.damage, value: "1d4")
        view.valueLabel.textColor = .lightSeaGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bodyView: InfoView = {
        let view = InfoView(characteristic: "Corpo", value: "1")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dodgeView: CharacteristicView = {
		let view = CharacteristicView(characteristic: LocalizedStrings.dodge, value: 50, preValue: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 9
        return view
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [damageView, bodyView, dodgeView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
	init(with generalCombat: GeneralCombat) {
		
        super.init(frame: .zero)
        configureLayout()
		
		damageView.valueLabel.text = generalCombat.damageBonus
		bodyView.valueLabel.text = "\(generalCombat.body)"
		dodgeView.changeCharacteristicValues(with: Int(generalCombat.dodgeValue))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
	
	func updateGeneralCombat(with newGeneral: GeneralCombat) {
		damageView.valueLabel.text = newGeneral.damageBonus
		bodyView.valueLabel.text = "\(newGeneral.body)"
		dodgeView.changeCharacteristicValues(with: Int(newGeneral.dodgeValue))
	}
}
