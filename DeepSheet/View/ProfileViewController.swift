//
//  ProfileViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 26/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let investigator: Investigator
    let investigatorPresenter: InvestigatorPresenter
    let profilePresenter: ProfilePresenter
    
    init(_ inv: Investigator) {
        self.investigator = inv
        self.investigatorPresenter = InvestigatorPresenter()
        self.profilePresenter = ProfilePresenter(self.investigator)
        self.profile = profilePresenter.fetchProfile()
        super.init(nibName: nil, bundle: nil)
        self.fillInFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var profile: Profile
    
    func fillInFields() {
        self.profile = profilePresenter.fetchProfile()
        self.characterIllustration.characterImage.image = (profile.image!.isEmpty) ? UIImage(named: "d10-green") : UIImage(data: profile.image ?? Data())
        self.nameInvestigator.valueText.text = self.investigator.name
        self.occupation.valueText.text = self.investigator.occupation
        self.namePlayer.valueText.text = self.profile.playerName
        self.age.valueText.text = self.profile.age
        self.gender.valueText.text = self.profile.gender
        self.address.valueText.text = self.profile.address
        self.birthPlace.valueText.text = self.profile.birthPlace
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
    
    lazy var nameInvestigator: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.investigatorName, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var characterIllustration: IllustrationView =  {
        let illustration = IllustrationView(image: UIImage(named: "d10-green")!)
        illustration.translatesAutoresizingMaskIntoConstraints = false
        return illustration
    }()
    
    lazy var occupation: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.occupation, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var namePlayer: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.playerName, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var age: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.age, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gender: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.gender, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var address: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.address, value: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var birthPlace: ProfileComponent = {
        let view = ProfileComponent(titleText: LocalizedStrings.birthPlace, value: "")
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
        self.present(EditProfileModal(action: {
            self.fillInFields()
         }, profile, self.profilePresenter, investigator, self.investigatorPresenter), animated: true, completion: nil)
    }
    
    private func configureLayout() {
        scrollingView.addSubview(headerButtons)
        scrollingView.addSubview(nameInvestigator)
        scrollingView.addSubview(characterIllustration)
        scrollingView.addSubview(occupation)
        scrollingView.addSubview(namePlayer)
        scrollingView.addSubview(age)
        scrollingView.addSubview(gender)
        scrollingView.addSubview(address)
        scrollingView.addSubview(birthPlace)
        
        NSLayoutConstraint.activate([
            scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
            headerButtons.heightAnchor.constraint(equalToConstant: 34),
            headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            nameInvestigator.topAnchor.constraint(equalTo: headerButtons.bottomAnchor, constant: 16),
            nameInvestigator.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            nameInvestigator.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            characterIllustration.topAnchor.constraint(equalTo: nameInvestigator.bottomAnchor, constant: -24),
            characterIllustration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            occupation.topAnchor.constraint(equalTo: characterIllustration.bottomAnchor, constant: 276),
            occupation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            occupation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            namePlayer.topAnchor.constraint(equalTo: occupation.bottomAnchor, constant: 16),
            namePlayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            namePlayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            age.topAnchor.constraint(equalTo: namePlayer.bottomAnchor, constant: 16),
            age.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            age.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -8),
            
            gender.topAnchor.constraint(equalTo: namePlayer.bottomAnchor, constant: 16),
            gender.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 8),
            gender.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            address.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 16),
            address.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            address.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            birthPlace.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            birthPlace.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            birthPlace.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
			birthPlace.bottomAnchor.constraint(equalTo: scrollingView.bottomAnchor)
        ])
    }
}
