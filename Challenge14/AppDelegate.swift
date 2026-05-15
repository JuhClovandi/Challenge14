//  AppDelegate.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos on 13/05/26.

// Ponto de entrada do app. Cuida da configuração global (Firebase, notificações, etc).
// A partir do iOS 13, a parte visual ficou com o SceneDelegate.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Chamado uma vez quando o app termina de abrir.
    // configurações globais (ex: iniciar Firebase, banco de dados).
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // Chamado quando o sistema precisa criar uma nova janela (scene).
    // No iPad com multitarefa, pode haver mais de uma janela aberta ao mesmo tempo.
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}
