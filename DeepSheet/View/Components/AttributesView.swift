//
//  AttributesView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

class AttributesView: UIView {
    
    // MARK: - Título
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold()
        label.textAlignment = .center
        label.textColor = .ivory
        label.text = "Attributes"
        return label
    }()
    
    // MARK: - Primeira linha
    let strView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.strAttribute, value: 50)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.strAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let dexView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.dexAttribute, value: 55)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.dexAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let intView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.intAttribute, value: 55, preValue: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.intAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [strView, dexView, intView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    // MARK: - Segunda linha
    let conView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.conAttribute, value: 75)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.conAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let appView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.appAttribute, value: 45)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.appAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let powView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.powAttribute, value: 50, preValue: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.powAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [conView, appView, powView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    // MARK: - Terceira linha
    let sizView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.sizAttribute, value: 80)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.sizAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let eduView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.eduAttribute, value: 61)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.eduAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    let movView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.movAttribute, value: 8, preValue: "", valueBy2: "-1", valueBy5: "+1")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.testName = LocalizedStrings.movAttributeText
        view.diceType = LocalizedStrings.rollDiceD100
        return view
    }()
    
    lazy var thirdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [sizView, eduView, movView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    // MARK: - Coluna Única
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 15
        self.addSubview(stack)
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        configureLayout()
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
	
	// MARK: - Editing Logic
	func setAllTextFieldDelegates(with delegate: UITextFieldDelegate) {
		strView.setTextFieldDelegate(with: delegate)
		dexView.setTextFieldDelegate(with: delegate)
		intView.setTextFieldDelegate(with: delegate)
		
		conView.setTextFieldDelegate(with: delegate)
		appView.setTextFieldDelegate(with: delegate)
		powView.setTextFieldDelegate(with: delegate)
		
		sizView.setTextFieldDelegate(with: delegate)
		eduView.setTextFieldDelegate(with: delegate)
		movView.setTextFieldDelegate(with: delegate)
	}
	
	func getAllCharacteristicValues() -> [Int] {
		let arr = [
			strView.getCharacteristicValue(),
			dexView.getCharacteristicValue(),
			intView.getCharacteristicValue(),
			conView.getCharacteristicValue(),
			appView.getCharacteristicValue(),
			powView.getCharacteristicValue(),
			sizView.getCharacteristicValue(),
			eduView.getCharacteristicValue(),
			movView.getCharacteristicValue()
		]
		
		return arr
	}
	
	func overwriteAllCharacteristicValues() {
		
		strView.overwriteCharacteristicValues()
		dexView.overwriteCharacteristicValues()
		intView.overwriteCharacteristicValues()
		
		conView.overwriteCharacteristicValues()
		appView.overwriteCharacteristicValues()
		powView.overwriteCharacteristicValues()
		
		sizView.overwriteCharacteristicValues()
		eduView.overwriteCharacteristicValues()
		movView.overwriteCharacteristicValues()
	}
	
	func changeAllCharacteristicValues(with newValues: [Int]) {
		
		strView.changeCharacteristicValues(with: newValues[0])
		dexView.changeCharacteristicValues(with: newValues[1])
		intView.changeCharacteristicValues(with: newValues[2])
		
		conView.changeCharacteristicValues(with: newValues[3])
		appView.changeCharacteristicValues(with: newValues[4])
		powView.changeCharacteristicValues(with: newValues[5])
		
		sizView.changeCharacteristicValues(with: newValues[6])
		eduView.changeCharacteristicValues(with: newValues[7])
		movView.changeCharacteristicValues(with: newValues[8])
	}
	
	func groupIsEditable(is toggle: Bool) {
		strView.isEditable(is: toggle)
		dexView.isEditable(is: toggle)
		intView.isEditable(is: toggle)
		
		conView.isEditable(is: toggle)
		appView.isEditable(is: toggle)
		powView.isEditable(is: toggle)
		
		sizView.isEditable(is: toggle)
		eduView.isEditable(is: toggle)
		movView.isEditable(is: toggle)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented, because will not be used on IB")
	}
}
