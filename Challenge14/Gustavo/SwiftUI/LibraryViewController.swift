//
//  LibraryViewController.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import Foundation
import UIKit
import SwiftUI

class LibraryViewController: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        // 1. Instancia a view do SwiftUI
            let swiftuiView = LibraryView()
            
            // 2. Cria o hosting controller
            let hostingController = UIHostingController(rootView: swiftuiView)
            
            // 3. Adiciona o ciclo de vida do container
            addChild(hostingController)
            
            // 4. CRUCIAL: Desativa os frames automáticos para o Auto Layout funcionar
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            
            // 5. Adiciona a view na hierarquia
            view.addSubview(hostingController.view)
            
            // 6. Configura as constraints ancorando na Safe Area (Evita que o topo corte)
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            hostingController.didMove(toParent: self)
//        view.backgroundColor = .black
//        hostingController.view.backgroundColor = .black
    }
}
