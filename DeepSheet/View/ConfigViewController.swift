//
//  ConfigViewController.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 09/12/20.
//

import UIKit

class ConfigViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitle(LocalizedStrings.investigators, for: .normal)
        button.tintColor = UIColor.ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationController?.navigationBar.setNavigationBarStyle()
        view.backgroundColor = .backgroundBlack
        
        let configButton = UIButton(type: .system)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .ultraLight, scale: .medium)
        configButton.setImage(UIImage(systemName: "gearshape.fill", withConfiguration: imageConfig), for: .normal)
        configButton.tintColor = .ivory
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: configButton)
        
        
        self.hideKeyboardWhenTappedAround()
        //additionalConfigurations()
        // Do any additional setup after loading the view.
    }
    
    @objc func backAction() {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
