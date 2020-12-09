//
//  TabBarViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 23/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    let investigator: Investigator
    
    init(_ investigator: Investigator) {
        self.investigator = investigator
        super.init(nibName: nil, bundle: nil)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.lightSeaGreen
        //self.tabBar.unselectedItemTintColor = .darkText

        let profileViewController = ProfileViewController(self.investigator)
        profileViewController.title = ("Profile")
        let profileViewControllerItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        profileViewControllerItem.title = "Profile"
        profileViewController.tabBarItem = profileViewControllerItem
        
        let statsViewController = AspectsViewController(self.investigator)
        statsViewController.title = ("Stats")
        statsViewController.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(named: "characteristic-icon"),
                                       selectedImage: UIImage(named: "characteristic-icon"))
        
        let skillsViewController = SkillsTableViewController(self.investigator)
        skillsViewController.title = ("Skills")
        skillsViewController.tabBarItem = UITabBarItem(title: "Skills", image: UIImage(named: "skill-icon"),
                                       selectedImage: UIImage(named: "skill-icon"))
        
		let combatViewController = CombatViewController(self.investigator)
        combatViewController.title = ("Combat")
        combatViewController.tabBarItem = UITabBarItem(title: "Combat", image: UIImage(named: "combat-icon"),
                                       selectedImage: UIImage(named: "combat-icon"))
        
        let bioViewController = BioViewController(self.investigator)
        bioViewController.title = ("Historic")
        bioViewController.tabBarItem = UITabBarItem(title: "Historic", image: UIImage(systemName: "book.fill"),
                                       selectedImage: UIImage(systemName: "book.fill"))

        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.overrideUserInterfaceStyle = .dark        
        let skillsNavigationController = UINavigationController(rootViewController: skillsViewController)
        let statsNavigationController = UINavigationController(rootViewController: statsViewController)
        statsNavigationController.overrideUserInterfaceStyle = .dark
        let combatNavigationController = UINavigationController(rootViewController: combatViewController)
        combatNavigationController.overrideUserInterfaceStyle = .dark
        let bioNavigationController = UINavigationController(rootViewController: bioViewController)
        bioNavigationController.overrideUserInterfaceStyle = .dark
        
        profileNavigationController.navigationBar.setNavigationBarStyle()
        statsNavigationController.navigationBar.setNavigationBarStyle()
        bioNavigationController.navigationBar.setNavigationBarStyle()
        self.viewControllers = [profileNavigationController, skillsNavigationController, statsNavigationController, combatNavigationController, bioNavigationController]
        
    }
}
