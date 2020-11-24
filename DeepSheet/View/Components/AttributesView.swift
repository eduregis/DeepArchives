//
//  AttributesView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

class AttributesView: UIView {
    
    // MARK: - Primeira linha
    let strView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.strAttribute, value: 50)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 0
        return view
    }()
    
    let dexView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.dexAttribute, value: 55)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 1
        return view
    }()
    
    let intView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.intAttribute, value: 55, preValue: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 2
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
        view.tag = 3
        return view
    }()
    
    let appView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.appAttribute, value: 45)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 4
        return view
    }()
    
    let powView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.powAttribute, value: 50, preValue: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 5
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
        view.tag = 6
        return view
    }()
    
    let eduView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.eduAttribute, value: 61)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 7
        return view
    }()
    
    let movView: CharacteristicView = {
        let view = CharacteristicView(characteristic: LocalizedStrings.movAttribute, value: 8, preValue: "", valueBy2: "-1", valueBy5: "+1")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 8
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on IB")
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
