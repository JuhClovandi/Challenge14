//  SceneDelegate.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos on 13/05/26.

// Cuida da janela visual do app. Cria a UIWindow, define a tela inicial e mantém tudo vivo enquanto a scene estiver ativa.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let rootViewController = AlbumDetailViewController()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}
