//
//  SkillsTableViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 24/11/20.
//

import UIKit

class SkillsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
        
    let skillsPresenter = SkillsPresenter()
    
    var skills: [Skill] = [] {
        didSet {
            filteredSkill = skills
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var isEditable = false
    
    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 118)
        headerView.addSubview(additionCard)
        headerView.addSubview(searchBar)
        return headerView
    }()

    lazy var searchBar: UISearchBar = {
      let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search Skill"
        searchBar.isTranslucent = false
        searchBar.delegate = self
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var additionCard: AdditionCardView = {
        let card = AdditionCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.additionCardLabel.text = "Add skill"
        return card
    }()
    
    @objc func additionButton(_ sender: UITapGestureRecognizer) {
        self.present(NewSkillModal(action: {
            self.fetchData()
        }), animated: true, completion: nil)
    }

    lazy var headerButtons: HeaderButtons = {
        let header = HeaderButtons()
        header.editButton.addTarget(self, action: #selector(self.enterEditing), for: .touchUpInside)
        header.cancelButton.addTarget(self, action: #selector(self.cancelEditing), for: .touchUpInside)
        header.confirmButton.addTarget(self, action: #selector(self.confirmEditing), for: .touchUpInside)
        header.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(header)
        return header
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
        let alert = DiceAlert(test: "", roll: "")
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.layer.backgroundColor = UIColor.backgroundBlack.cgColor
        alert.layer.opacity = 0
        self.view.addSubview(alert)
        return alert
    }()

    private func setupSearchBar() {
        self.additionCard.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.additionButton(_:)))
        tap.numberOfTapsRequired = 1
        self.additionCard.addGestureRecognizer(tap)
        self.tableView.tableHeaderView = headerView
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if textSearched == "" {
            filteredSkill = skills
        } else {
            filteredSkill = skills.filter { item in
                return item.name!.lowercased().contains(textSearched.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    var filteredSkill: [Skill] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredSkill.count
    }
    
    @objc func dismissAlert() {
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 0
            self.dimmingOverlay.layer.opacity = 0
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell") as! SkillTableViewCell
        let skill = filteredSkill[indexPath.row]
        cell.set(skill: skill)
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to: size, with: coordinator)
      DispatchQueue.main.async {
        self.tableView.tableHeaderView?.layoutIfNeeded()
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
      }
    }
    
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView?.layoutIfNeeded()
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
        setupSearchBar()
        configureTableView()
        fetchData()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.hideKeyboardWhenTappedAround()
        self.tableView.tableFooterView = UIView()
    }
    
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.changePlaceholderColor(.lightSeaGreen)
        searchBar.textField?.textColor = .lightSeaGreen
        searchBar.textField?.backgroundColor = .searchBarGray
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .backgroundBlack
        //set the delegates
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 59
        tableView.register(SkillTableViewCell.self, forCellReuseIdentifier: "SkillCell")
        dimmingOverlay.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        diceAlert.okButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        configureConstraints()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedSkill = filteredSkill[indexPath.row]
        if !isEditable {
            diceAlert.rollDice(rollText: filteredSkill[indexPath.row].name!, rollType: filteredSkill[indexPath.row].diceType!)
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.diceAlert.layer.opacity = 1
                self.dimmingOverlay.layer.opacity = 0.6
            })
        } else {
            self.present(EditSkillModal(action: {
                self.fetchData()
            }, selectedSkill), animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let skillToRemove = self.filteredSkill[indexPath.row]
        if skillToRemove.userCreated && isEditable {
            let action = UIContextualAction(style: .destructive, title: "Delete") { ( _, _, _) in
                self.skillsPresenter.deleteSkill(skillToRemove)
                self.fetchData()
            }
            return UISwipeActionsConfiguration(actions: [action])
        } else {
            return nil
        }

    }
    
    func configureConstraints() {
        tableView.contentInset.top = 18
        tableView.contentOffset = CGPoint(x: -18, y: -18)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        diceAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        diceAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        dimmingOverlay.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        dimmingOverlay.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        dimmingOverlay.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        dimmingOverlay.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        headerButtons.topAnchor.constraint(equalTo: tableView.tableHeaderView!.topAnchor, constant: -18).isActive = true
        headerButtons.heightAnchor.constraint(equalToConstant: 34).isActive = true
        headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        
        additionCard.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        additionCard.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 16).isActive = true
        let trailing = additionCard.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -16)
        trailing.priority = .defaultLow
        trailing.isActive = true
        additionCard.isHidden = true
    }
    
    func fetchData() {
        self.skills = skillsPresenter.fetchSkills()
    }
    
    @objc func enterEditing() {
        headerButtons.enterEditing()
        additionCard.isHidden = false
        isEditable = true
    }
    
    @objc func cancelEditing() {
        isEditable = false
        additionCard.isHidden = true
        headerButtons.endEditing()
    }
    
    @objc func confirmEditing() {
        isEditable = false
        additionCard.isHidden = true
        headerButtons.endEditing()
    }

}
