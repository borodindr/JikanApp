//
//  RootTabBarController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit

/// Root view controller of the app displaying.
final class RootTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Populate tab bars with needed view controllers
        setViewControllers()
    }
    
    
    // MARK: - Private methods
    
    private func setViewControllers() {
        let vc0 = animeSearchNavigationController()
        let vc1 = characterSearchNavigationController()
        
        setViewControllers([vc0, vc1], animated: false)
    }
    
    private func animeSearchNavigationController() -> UIViewController {
        wrappedVCForTabBar(
            rootVC: AnimeSearchViewController(),
            title: "Anime",
            image: UIImage(systemName: "film")
        )
    }
    
    private func characterSearchNavigationController() -> UIViewController {
        wrappedVCForTabBar(
            rootVC: CharacterSearchViewController(),
            title: "Characters",
            image: UIImage(systemName: "person")
        )
    }
    
    // Wraps provided root UIViewController to UINavigationController and sets its tab bar item's title and image
    private func wrappedVCForTabBar(rootVC: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
