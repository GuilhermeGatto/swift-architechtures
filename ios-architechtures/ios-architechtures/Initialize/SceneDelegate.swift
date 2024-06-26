//
//  SceneDelegate.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let navigationController = UINavigationController()
        let coordinator = ProducListCoordinator(navigation: navigationController)
        coordinator.start()
        window = UIWindow(frame: .zero)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
    }
}

