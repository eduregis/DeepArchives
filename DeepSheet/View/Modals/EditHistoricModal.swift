//
//  EditHistoricModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 30/11/20.
//

import UIKit

class EditHistoricModal: UIViewController {
    
    var actualPage = 0
    var lastPage = 4
    
    var historic: Historic
    
    let historicPresenter: HistoricPresenter
    
    var editionAction: (() -> ())?

    init(action: @escaping () -> (), _ historicReceived: Historic, _ presenter: HistoricPresenter) {
        historic = historicReceived
        self.historicPresenter = presenter
        super.init(nibName: nil, bundle: nil)
        editionAction = action
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        label.text = LocalizedStrings.editHistoric
        label.font = UIFont.josefinSansButton()
        self.view.addSubview(label)
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedStrings.cancelButton, for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        self.view.addSubview(button)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedStrings.nextButton, for: .normal)
        button.setTitleColor(.lightSeaGreen, for: .normal)
        button.titleLabel?.font = UIFont.josefinSansButton()
        self.view.addSubview(button)
        return button
    }()
    
    // MARK: - First Group
    
    lazy var personalDescriptionView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.personalDescription, multiline: true)
        return view
    }()
    
    lazy var ideologyView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.ideology, multiline: true)
        return view
    }()
    
    lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [personalDescriptionView, ideologyView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Second Group
    
    lazy var traitsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.traits, multiline: true)
        return view
    }()
    
    lazy var woundsAndScarsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.woundsAndScars, multiline: true)
        return view
    }()
    
    lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [traitsView, woundsAndScarsView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Third Group
    
    lazy var phobiasAndManiasView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.phobiasAndManias, multiline: true)
        return view
    }()
    
    lazy var importantPersonsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.importantPersons, multiline: true)
        return view
    }()
    
    lazy var thirdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [phobiasAndManiasView, importantPersonsView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Fourth Group
    
    lazy var importantLocalsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.importantPersons, multiline: true)
        return view
    }()
    
    lazy var possessionsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.possessions, multiline: true)
        return view
    }()
    
    lazy var fourthStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [importantLocalsView, possessionsView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Fifth Group
    
    lazy var tomesAndSpellsView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.tomesAndSpells, multiline: true)
        return view
    }()
    
    lazy var meetingWithEntitiesView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.meetingWithEntities, multiline: true)
        return view
    }()
    
    lazy var fifthStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tomesAndSpellsView, meetingWithEntitiesView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
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
        
        firstStack.isHidden = false
        secondStack.isHidden = true
        thirdStack.isHidden = true
        fourthStack.isHidden = true
        fifthStack.isHidden = true
    }
    
    @objc func leftButtonBehavior() {
        if actualPage == 0 {
            dismiss(animated: true, completion: nil)
        } else {
            actualPage -= 1
        }
        atualizeUI()
    }
    
    @objc func rightButtonBehavior() {
        if actualPage == lastPage {
            dismiss(animated: true, completion: nil)
        } else {
            actualPage += 1
        }
        atualizeUI()
    }
    
    func atualizeUI() {
        if actualPage == 0 {
            leftButton.setTitle(LocalizedStrings.cancelButton, for: .normal)
        } else {
            leftButton.setTitle(LocalizedStrings.backButton, for: .normal)
        }
        
        if actualPage == lastPage {
            rightButton.setTitle(LocalizedStrings.confirmButton, for: .normal)
        } else {
            rightButton.setTitle(LocalizedStrings.nextButton, for: .normal)
        }
        
        switch actualPage {
        case 0:
            firstStack.isHidden = false
            secondStack.isHidden = true
            thirdStack.isHidden = true
            fourthStack.isHidden = true
            fifthStack.isHidden = true
        case 1:
            firstStack.isHidden = true
            secondStack.isHidden = false
            thirdStack.isHidden = true
            fourthStack.isHidden = true
            fifthStack.isHidden = true
        case 2:
            firstStack.isHidden = true
            secondStack.isHidden = true
            thirdStack.isHidden = false
            fourthStack.isHidden = true
            fifthStack.isHidden = true
        case 3:
            firstStack.isHidden = true
            secondStack.isHidden = true
            thirdStack.isHidden = true
            fourthStack.isHidden = false
            fifthStack.isHidden = true
        case 4:
            firstStack.isHidden = true
            secondStack.isHidden = true
            thirdStack.isHidden = true
            fourthStack.isHidden = true
            fifthStack.isHidden = false
        default:
            break
        }
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
            
            firstStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            firstStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            firstStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),

            secondStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            secondStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            secondStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            thirdStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            thirdStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            thirdStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            fourthStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            fourthStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            fourthStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),

            fifthStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            fifthStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            fifthStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
            
        ])
    }
}
