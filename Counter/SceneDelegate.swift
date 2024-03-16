//
//  SceneDelegate.swift
//  Counter
//
//  Created by Edward on 14.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            let viewController = CounterViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }

