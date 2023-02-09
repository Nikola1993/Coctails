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
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationViewController = UINavigationController()
            let screen = Dashboard()
            let vc = UIHostingController(rootView: screen)
            navigationViewController.setViewControllers([vc], animated: false)
            self.window = window
            window.rootViewController = navigationViewController
            window.makeKeyAndVisible()
        }
    }
}
