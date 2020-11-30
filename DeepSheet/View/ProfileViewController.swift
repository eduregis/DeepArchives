//
//  ProfileViewController.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 26/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
        scroll.alwaysBounceVertical = false
        self.view.addSubview(scroll)
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        additionalConfigurations()
    }
    
    private func additionalConfigurations() {
        configureLayout()
        view.backgroundColor = .backgroundBlack
        
    }
    
    @objc func triggerModal () {
        let editModal = NewItemModal()
        present(editModal, animated: true, completion: nil)
    }
    
    private func configureLayout() {
        scrollingView.addSubview(headerButtons)
        
        NSLayoutConstraint.activate([
            scrollingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            scrollingView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            scrollingView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            scrollingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            headerButtons.topAnchor.constraint(equalTo: scrollingView.topAnchor, constant: 0),
            headerButtons.heightAnchor.constraint(equalToConstant: 34),
            headerButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            headerButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
}
