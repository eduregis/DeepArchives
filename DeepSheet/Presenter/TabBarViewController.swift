//
//  TabBarViewController.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 23/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor.lightSeaGreen
        //self.tabBar.unselectedItemTintColor = .darkText

        let profileViewController = ViewController()
        profileViewController.title = ("Profile")
        let profileViewControllerItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"),
                                       selectedImage: UIImage(systemName: "person.fill"))
        profileViewControllerItem.title = "Profile"
        profileViewController.tabBarItem = profileViewControllerItem
        
        let statsViewController = ViewController()
        statsViewController.title = ("Stats")
        statsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let skillsViewController = ViewController()
        skillsViewController.title = ("Skills")
        skillsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 2)
        
        let combatViewController = ViewController()
        combatViewController.title = ("Combat")
        combatViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 3)
        
        let bioViewController = ViewController()
        bioViewController.title = ("Bio")
        bioViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 4)

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
        self.viewControllers = [profileNavigationController, skillsNavigationController,statsNavigationController, combatNavigationController, bioNavigationController]
        
    }
}
