//
//  TabBarViewController.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let homeNavigationController: UINavigationController
    private let allCoctailsNavigationController: UINavigationController
    private let favouriteNavigationController: UINavigationController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    // MARK: - Init
    init(homeNavigationController: UINavigationController,
         allCoctailsNavigationController: UINavigationController,
         favouriteNavigationController: UINavigationController) {
        self.homeNavigationController = homeNavigationController
        self.allCoctailsNavigationController = allCoctailsNavigationController
        self.favouriteNavigationController = favouriteNavigationController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarViewAppearance()
    }
    
    
    // MARK: - Private Fucntions
    private func createNavController(for navigationController: UINavigationController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
    
    private func setTabBarViewAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        updateTabBarItemAppearance(appearance: appearance.compactInlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: appearance.inlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: appearance.stackedLayoutAppearance)
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    private func updateTabBarItemAppearance(appearance: UITabBarItemAppearance) {
        let tintColor: UIColor = UIColor.brownColor
        let unselectedItemTintColor: UIColor = .white
        
        appearance.normal.iconColor = unselectedItemTintColor
        appearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: unselectedItemTintColor]
        
        appearance.selected.iconColor = tintColor
        appearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: homeNavigationController, title: "Home", image: UIImage(systemName: "house")!),
              createNavController(for: allCoctailsNavigationController, title: "All", image: UIImage(systemName: "list.bullet.rectangle")!),
              createNavController(for: favouriteNavigationController, title: "Favourite", image: UIImage(systemName: "star.fill")!)
          ]
      }
}
