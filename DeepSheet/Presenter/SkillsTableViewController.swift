//
//  SkillsTableViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 24/11/20.
//

import UIKit

class SkillsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var skills: [Skill] = [] {
        didSet {
        filteredSkill = skills
        self.tableView.reloadData()
        }
    }
    
    lazy var searchBar: UISearchBar = UISearchBar()
    
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
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search Skill"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.barTintColor = .systemGray6
//        searchBar.backgroundColor = .backgroundBlack
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if textSearched == "" {
            filteredSkill = skills
        } else {
            filteredSkill = skills.filter { item in
                return item.skillName.lowercased().contains(textSearched.lowercased())
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
    
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchData()
        setupSearchBar()
        self.hideKeyboardWhenTappedAround()
        self.tableView.tableFooterView = UIView()
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
        diceAlert.rollDice(rollText: filteredSkill[indexPath.row].testName, rollType: filteredSkill[indexPath.row].diceType)
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.diceAlert.layer.opacity = 1
            self.dimmingOverlay.layer.opacity = 0.6
        })
    }
    
    func configureConstraints() {
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
    }
    
    func fetchData() {
        skills.append(Skill(skillName: "Run", skillPoints: 25, isActivated: true, testName: "Run (Skill)", diceType: LocalizedStrings.rollDiceD100))
        skills.append(Skill(skillName: "Search", skillPoints: 25, isActivated: true, testName: "Search (Skill)", diceType: LocalizedStrings.rollDiceD100))
        skills.append(Skill(skillName: "Seek", skillPoints: 1, isActivated: false, skillDesc: "Textin", testName: "Seek (Skill)", diceType: LocalizedStrings.rollDiceD100))
    }

}
