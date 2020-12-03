//
//  CombatViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class CombatViewController: UIViewController {

    lazy var additionCard: AdditionCardView = {
        let card = AdditionCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(card)
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        additionalConfigurations()
    }
    
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
    private func additionalConfigurations() {
        configureLayout()
        additionCard.additionCardLabel.text = "Adicionar Item"
        view.backgroundColor = .backgroundBlack
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            additionCard.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
            additionCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            additionCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}
