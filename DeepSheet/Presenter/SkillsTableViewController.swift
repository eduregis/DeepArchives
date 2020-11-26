//
//  SkillsTableViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 24/11/20.
//

import UIKit

class SkillsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var skills:[Skill] = [] {
        didSet {
        filteredSkill = skills
        self.tableView.reloadData()
        }

    }
    
    lazy var searchBar: UISearchBar = UISearchBar()

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
        configureConstraints()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("roludo")
    }
    func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func fetchData(){
        skills.append(Skill(skillName: "Run", skillPoints: 25, isActivated: true))
        skills.append(Skill(skillName: "Search", skillPoints: 25, isActivated: true))
        skills.append(Skill(skillName: "Seek", skillPoints: 1, isActivated: false, skillDesc: "Textin"))
    }

}
