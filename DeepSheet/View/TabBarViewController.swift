//
//  TabBarViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 23/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {
//    var investigator: Investigator = {
//        let inv = Investigator
//        
//    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.lightSeaGreen
        //self.tabBar.unselectedItemTintColor = .darkText

        let profileViewController = ProfileViewController()
        profileViewController.title = ("Profile")
        let profileViewControllerItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        profileViewControllerItem.title = "Profile"
        profileViewController.tabBarItem = profileViewControllerItem
        
        let statsViewController = AspectsViewController()
        statsViewController.title = ("Stats")
        statsViewController.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(named: "characteristic-icon"),
                                       selectedImage: UIImage(named: "characteristic-icon"))
        
        let skillsViewController = SkillsTableViewController()
        skillsViewController.title = ("Skills")
        skillsViewController.tabBarItem = UITabBarItem(title: "Skills", image: UIImage(named: "skill-icon"),
                                       selectedImage: UIImage(named: "skill-icon"))
        
        let combatViewController = CombatViewController()
        combatViewController.title = ("Combat")
        combatViewController.tabBarItem = UITabBarItem(title: "Combat", image: UIImage(named: "combat-icon"),
                                       selectedImage: UIImage(named: "combat-icon"))
        
        let bioViewController = BioViewController()
        bioViewController.title = ("Bio")
        bioViewController.tabBarItem = UITabBarItem(title: "Bio", image: UIImage(systemName: "book.fill"),
                                       selectedImage: UIImage(systemName: "book.fill"))

        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.overrideUserInterfaceStyle = .dark        
        let skillsNavigationController = UINavigationController(rootViewController: skillsViewController)
        skillsNavigationController.overrideUserInterfaceStyle = .dark
        let statsNavigationController = UINavigationController(rootViewController: statsViewController)
        statsNavigationController.overrideUserInterfaceStyle = .dark
        let combatNavigationController = UINavigationController(rootViewController: combatViewController)
        combatNavigationController.overrideUserInterfaceStyle = .dark
        let bioNavigationController = UINavigationController(rootViewController: bioViewController)
        bioNavigationController.overrideUserInterfaceStyle = .dark
        
        profileNavigationController.navigationBar.setNavigationBarStyle()
        skillsNavigationController.navigationBar.setNavigationBarStyle()
        statsNavigationController.navigationBar.setNavigationBarStyle()
        combatNavigationController.navigationBar.setNavigationBarStyle()
        bioNavigationController.navigationBar.setNavigationBarStyle()
        self.viewControllers = [profileNavigationController, skillsNavigationController, statsNavigationController, combatNavigationController, bioNavigationController]
        
    }
}
