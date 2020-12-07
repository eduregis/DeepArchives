//
//  EditSkillModal.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 05/12/20.
//

import UIKit

class EditSkillModal: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var actualPage = 0
    var lastPage = 1
    
    let skillsPresenter: SkillsPresenter
    
    var tableView = UITableView()
    var categories: [String] = [LocalizedStrings.artSkill, LocalizedStrings.nativeLanguageSkill, LocalizedStrings.officeSkill, LocalizedStrings.otherLanguageSkill, LocalizedStrings.pilotSkill, LocalizedStrings.mechRepairSkill]
    
    var skill: Skill
    
    var selectedCategoryIndex = 0
    
    var editionAction: (() -> ())?

    init(action: @escaping () -> (), _ skillReceived: Skill, _ presenter: SkillsPresenter) {
        skill = skillReceived
        self.skillsPresenter = presenter
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
        label.text = LocalizedStrings.editSkillName
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
    
    lazy var skillNameView: EditModalComponent = {
        let stack = EditModalComponent(titleText: LocalizedStrings.skillName)
        return stack
    }()
    
    lazy var valueView: EditModalComponent = {
        let stack = EditModalComponent(titleText: LocalizedStrings.value)
        return stack
    }()
    
    lazy var isActivatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .ivory
        label.font = UIFont.josefinSansBold()
        label.text = LocalizedStrings.isActivatedSkill
        return label
    }()
    
    lazy var isActivatedSwitch: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.onTintColor = UIColor.lightSeaGreen
        return switchBtn
    }()
    
    lazy var isActivatedStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [isActivatedLabel, isActivatedSwitch])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 15
        return stack
    }()
    
    lazy var firstStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [skillNameView, valueView, isActivatedStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 22
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Second Group
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .ivory
        label.font = UIFont.josefinSansBold()
        label.text = LocalizedStrings.category
        return label
    }()
    
    lazy var secondStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [categoryLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 15
        self.view.addSubview(stack)
        return stack
    }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        configureTableView()
        additionalConfigurations()
        leftButton.addTarget(self, action: #selector(leftButtonBehavior), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonBehavior), for: .touchUpInside)
        if !skill.userCreated {
            skillNameView.valueText.isEditable = false
            lastPage = 0
            rightButton.setTitle(LocalizedStrings.confirmButton, for: .normal)
        } else {
            selectedCategoryIndex = Int(skill.desc - 1)
        }
        skillNameView.valueText.text = skill.name
        valueView.valueText.text = "\(skill.value)"
        isActivatedSwitch.isOn = skill.isActivated
        firstStack.isHidden = false
        secondStack.isHidden = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        secondStack.addArrangedSubview(tableView)
        tableView.backgroundColor = .backgroundBlack
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //set the delegates
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 59
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
            editSkill()
            dismiss(animated: true, completion: editionAction)
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
        case 1:
            firstStack.isHidden = true
            secondStack.isHidden = false
        default:
            break
        }
    }
    
    // MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        cell.backgroundColor = .ivory
        cell.tintColor = UIColor.lightSeaGreen
        if selectedCategoryIndex == indexPath.row {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectedCategoryIndex = indexPath.row
        tableView.reloadData()
    }
    
    func editSkill() {
        if skill.userCreated {
            skill.desc = Int64(selectedCategoryIndex + 1)
        }
        skillsPresenter.editSkill(skillNameView.valueText.text!, Int64(valueView.valueText.text!), isActivatedSwitch.isOn, skill)
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
            secondStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
