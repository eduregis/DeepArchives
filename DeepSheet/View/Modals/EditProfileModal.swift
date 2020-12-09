//
//  EditProfileModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 26/11/20.
//

import UIKit

class EditProfileModal: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var actualPage = 0
    var lastPage = 2
    
    var profile: Profile
    let profilePresenter: ProfilePresenter
    
    var investigator: Investigator
    let investigatorPresenter: InvestigatorPresenter
    
    var editionAction: (() -> ())?

    init(action: @escaping () -> (), _ profileReceived: Profile, _ profilePresenter: ProfilePresenter, _ investigatorReceived: Investigator, _ investigatorPresenter: InvestigatorPresenter) {
        profile = profileReceived
        self.profilePresenter = profilePresenter
        investigator = investigatorReceived
        self.investigatorPresenter = investigatorPresenter
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
        label.text = LocalizedStrings.editProfileName
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
    
    lazy var investigatorView: EditModalComponent = {
        let stack = EditModalComponent(titleText: LocalizedStrings.investigatorName)
        return stack
    }()
    
    lazy var characterIllustration: IllustrationView =  {
        let illustration = IllustrationView(image: UIImage(named: "d10-green")!)
        return illustration
    }()
    
    lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [investigatorView, characterIllustration])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Second Group
    
    lazy var playerView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.playerName)
        return view
    }()
    
    lazy var occupationView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.occupation)
        return view
    }()
    
    lazy var ageView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.age)
        return view
    }()
    
    lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [playerView, occupationView, ageView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Third Group
    
    lazy var genderView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.gender)
        return view
    }()
    
    lazy var addressView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.address)
        return view
    }()
    
    lazy var birthPlaceView: EditModalComponent = {
        let view = EditModalComponent(titleText: LocalizedStrings.birthPlace)
        return view
    }()
    
    lazy var thirdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [genderView, addressView, birthPlaceView])
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
        
        self.characterIllustration.characterImage.image = (profile.image!.isEmpty) ? UIImage(named: "d10-green") : UIImage(data: profile.image ?? Data())
        investigatorView.valueText.text = investigator.name
        occupationView.valueText.text = investigator.occupation
        playerView.valueText.text = profile.playerName
        ageView.valueText.text = profile.age
        genderView.valueText.text = profile.gender
        addressView.valueText.text = profile.address
        birthPlaceView.valueText.text = profile.birthPlace
        
        characterIllustration.borderView.addTarget(self, action: #selector(changeIllustration), for: .touchUpInside)
        
        firstStack.isHidden = false
        secondStack.isHidden = true
        thirdStack.isHidden = true
    }
    
    @objc func leftButtonBehavior() {
        if actualPage == 0 {
            dismiss(animated: true, completion: editionAction)
        } else {
            actualPage -= 1
        }
        atualizeUI()
    }
    
    @objc func rightButtonBehavior() {
        if actualPage == lastPage {
            editProfile()
            dismiss(animated: true, completion: editionAction)
        } else {
            actualPage += 1
        }
        atualizeUI()
    }
    
    @objc func changeIllustration () {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickerImage = info[.editedImage] as? UIImage else {
            return
        }
        characterIllustration.characterImage.image = userPickerImage
        picker.dismiss(animated: true, completion: nil)
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
        case 1:
            firstStack.isHidden = true
            secondStack.isHidden = false
            thirdStack.isHidden = true
        case 2:
            firstStack.isHidden = true
            secondStack.isHidden = true
            thirdStack.isHidden = false
        default:
            break
        }
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
    
    func editProfile() {
        investigatorPresenter.editInvestigator(investigatorView.valueText.text, occupationView.valueText.text, investigator)
        
        profilePresenter.editProfile(playerView.valueText.text, ageView.valueText.text, genderView.valueText.text, addressView.valueText.text, birthPlaceView.valueText.text, characterIllustration.characterImage.image?.pngData() ?? Data(), profile)
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
            
            characterIllustration.heightAnchor.constraint(equalToConstant: 216),
            
            firstStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            firstStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            firstStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),

            secondStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            secondStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            secondStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            thirdStack.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 30),
            thirdStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            thirdStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
            
        ])
    }
}
