//
//  ConfigViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 09/12/20.
//

import UIKit

class ConfigViewController: UIViewController {

    var configTableView = UITableView()
    var languages: [String] = ["English", "Português Brasileiro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle("Back", for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationController?.navigationBar.setNavigationBarStyle()
        view.backgroundColor = .clear
        self.hideKeyboardWhenTappedAround()
        
        setupConfigtableView()
        configTableViewDelegates()
     
    }
    
    func setupConfigtableView() {
        view.addSubview(configTableView)
        configTableView.rowHeight = 44
        configTableView.register(ConfigTableViewCell.self, forCellReuseIdentifier: "ConfigCell")
        configTableView.translatesAutoresizingMaskIntoConstraints = false
        configTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        configTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        configTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        configTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func configTableViewDelegates() {
        configTableView.delegate = self
        configTableView.dataSource = self
    }
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
}

extension ConfigViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = configTableView.dequeueReusableCell(withIdentifier: "ConfigCell") as! ConfigTableViewCell
        cell.configCellLabel.text = languages[indexPath.row]
        cell.configCellLabel.textColor = .ivory
        print("serula")
        return cell
    }
}
