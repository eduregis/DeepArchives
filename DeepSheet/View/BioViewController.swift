//
//  BioViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 25/11/20.
//
import UIKit

class BioViewController: UIViewController {
    
    let investigator: Investigator
    let historicPresenter: HistoricPresenter
    
    init(_ inv: Investigator) {
        self.investigator = inv
        self.historicPresenter = HistoricPresenter(self.investigator)
        self.historic = historicPresenter.fetchHistoric()
        super.init(nibName: nil, bundle: nil)
        self.fillInFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var historic: Historic
    
    func fillInFields() {
        self.personalDescription.valueText.text = self.historic.personalDescription
        self.ideology.valueText.text = self.historic.ideology
        self.traits.valueText.text = self.historic.traits
        self.woundsAndScars.valueText.text = self.historic.woundsAndScars
        self.phobiasAndManias.valueText.text = self.historic.phobiasAndManias
        self.importantPersons.valueText.text = self.historic.importantPersons
        self.importantLocals.valueText.text = self.historic.importantLocals
        self.possessions.valueText.text = self.historic.possessions
        self.tomesAndSpells.valueText.text = self.historic.tomesAndSpells
        self.meetingWithEntities.valueText.text = self.historic.meetingWithEntities
    }
    
    lazy var headerButtons: HeaderButtons = {
        let header = HeaderButtons()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.editButton.addTarget(self, action: #selector(triggerModal), for: .touchUpInside)
        return header
    }()
    
    lazy var scrollingView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        scroll.isScrollEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        self.view.addSubview(scroll)
        return scroll
    }()
    
    lazy var personalDescription: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.personalDescription, value: "Edvaldo Cleiton Rasta, fazendo a festa pra galera.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ideology: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.ideology, value: "Fazer a galera debochar legal.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var traits: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.traits, value: "Cabeça de Gelo.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var woundsAndScars: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.woundsAndScars, value: "Nenhum.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
	
    lazy var phobiasAndManias: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.phobiasAndManias, value: "Desconsiderar o nego.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var importantPersons: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.importantPersons, value: "Atalaia aí, ó.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var importantLocals: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.importantLocals, value: "Povoado Santo Antônio.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var possessions: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.possessions, value: "Primeiro DVD.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tomesAndSpells: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.tomesAndSpells, value: "Fogo na Babilônia.\nChama\nAcende um pra relaxar\nVir para conquistar\nOlha a pedra", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var meetingWithEntities: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.meetingWithEntities, value: "nenhum.", multiline: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.hideKeyboardWhenTappedAround()
        additionalConfigurations()
    }
    
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
    
    @objc func triggerModal () {
        self.present(EditHistoricModal(action: {
        }, historic, self.historicPresenter), animated: true, completion: nil)
    }
    
    private func configureLayout() {
        scrollingView.addSubview(headerButtons)
        scrollingView.addSubview(personalDescription)
        scrollingView.addSubview(ideology)
        scrollingView.addSubview(traits)
        scrollingView.addSubview(woundsAndScars)
        scrollingView.addSubview(phobiasAndManias)
        scrollingView.addSubview(importantPersons)
        scrollingView.addSubview(importantLocals)
        scrollingView.addSubview(possessions)
        scrollingView.addSubview(tomesAndSpells)
        scrollingView.addSubview(meetingWithEntities)
        
        NSLayoutConstraint.activate([
            scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
            headerButtons.heightAnchor.constraint(equalToConstant: 34),
            headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            personalDescription.topAnchor.constraint(equalTo: headerButtons.bottomAnchor, constant: 16),
            personalDescription.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            personalDescription.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            ideology.topAnchor.constraint(equalTo: personalDescription.bottomAnchor, constant: 16),
            ideology.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            ideology.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            traits.topAnchor.constraint(equalTo: ideology.bottomAnchor, constant: 16),
            traits.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            traits.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            woundsAndScars.topAnchor.constraint(equalTo: traits.bottomAnchor, constant: 16),
            woundsAndScars.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            woundsAndScars.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            phobiasAndManias.topAnchor.constraint(equalTo: woundsAndScars.bottomAnchor, constant: 16),
            phobiasAndManias.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            phobiasAndManias.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            importantPersons.topAnchor.constraint(equalTo: phobiasAndManias.bottomAnchor, constant: 16),
            importantPersons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            importantPersons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            importantLocals.topAnchor.constraint(equalTo: importantPersons.bottomAnchor, constant: 16),
            importantLocals.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            importantLocals.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            possessions.topAnchor.constraint(equalTo: importantLocals.bottomAnchor, constant: 16),
            possessions.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            possessions.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            tomesAndSpells.topAnchor.constraint(equalTo: possessions.bottomAnchor, constant: 16),
            tomesAndSpells.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tomesAndSpells.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            meetingWithEntities.topAnchor.constraint(equalTo: tomesAndSpells.bottomAnchor, constant: 16),
            meetingWithEntities.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            meetingWithEntities.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            meetingWithEntities.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor)
            
        ])
    }
}
