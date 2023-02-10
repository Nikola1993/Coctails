//
//  SceneDelegate.swift
//  Coctails App
//
//  Created by Nikola on 9.2.23..
//

import UIKit
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let tabBarVC = TabBarViewController(homeNavigationController: homeNavigationVC,
                                                allCoctailsNavigationController: allCoctailsNavigationVC,
                                                favouriteNavigationController: favouriteNavigationVC)
            self.window = window
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
        }
    }
    
    private lazy var urlSessionClient: HTTPClient = {
        return URLSessionHTTPClient(session: .shared)
    }()
    
    private lazy var homeNavigationVC: UINavigationController = {
        let homeNavigationController = UINavigationController()
        let homeScreenService = HomeScreenService(client: urlSessionClient)
        let homeScreen = HomeScreen(viewModel: HomeScreenViewModel(loader: homeScreenService))
        let homeVC = UIHostingController(rootView: homeScreen)
        homeNavigationController.navigationBar.prefersLargeTitles = true
        homeNavigationController.setViewControllers([homeVC], animated: false)
        homeVC.title = "Home"
        return homeNavigationController
    }()
    
    private lazy var allCoctailsNavigationVC: UINavigationController = {
        let allCoctailsNavigationController = UINavigationController()
        let allCoctailScreen = AllCoctailsScreen()
        let allCoctailVC = UIHostingController(rootView: allCoctailScreen)
        allCoctailsNavigationController.navigationBar.prefersLargeTitles = true
        allCoctailVC.title = "All Coctails"
        allCoctailsNavigationController.setViewControllers([allCoctailVC], animated: false)
        return allCoctailsNavigationController
    }()
    
    private lazy var favouriteNavigationVC: UINavigationController = {
        let favouriteNavigationController = UINavigationController()
        let favouriteScreen = FavouriteCoctailsScreen()
        let favouriteVC = UIHostingController(rootView: favouriteScreen)
        favouriteNavigationController.navigationBar.prefersLargeTitles = true
        favouriteVC.title = "Favourite"
        favouriteNavigationController.setViewControllers([favouriteVC], animated: false)
        return favouriteNavigationController
    }()
}
