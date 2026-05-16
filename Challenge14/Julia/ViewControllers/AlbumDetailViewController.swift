//  AlbumDetailViewController.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// ViewController principal. Hospeda a AlbumView (SwiftUI) dentro do UIKit.
// O UIKit controla o ciclo de vida, o SwiftUI controla a interface visual.
// A ponte entre eles é feita via UIHostingController.

import UIKit
import SwiftUI

// MARK: - AlbumDetailViewController

/// `final` porque essa classe não será herdada — isso permite ao compilador otimizar as chamadas.
final class AlbumDetailViewController: UIViewController {

    // MARK: - Properties

    // UIHostingController que embute a AlbumView (SwiftUI) dentro do UIKit.
    /// `lazy` para ser criado só quando necessário.
    private lazy var hostingController: UIHostingController<AlbumView> = {
        let controller = UIHostingController(rootView: AlbumView())
        controller.view.backgroundColor = .clear
        return controller
    }()

    // MARK: - Lifecycle

    // Chamado 1x quando a view carrega. Configuração inicial acontece aqui.
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad — Configuração inicial (chamado 1x)")

        setupBackground()
        embedSwiftUIView()
        setupTraitObservations()
    }

    // Chamado toda vez que a tela vai aparecer (inclusive ao voltar de outra tela).
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("viewWillAppear — A view vai aparecer (chamado toda vez)")

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // Chamado toda vez que a tela já está 100% visível. Bom pra iniciar animações.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print("viewDidAppear — A view já está visível na tela")
    }

    // Chamado quando a tela vai sair. Bom pra pausar coisas (música, timers).
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print("viewWillDisappear — A view vai desaparecer")
    }

    // Chamado quando a tela já saiu. Bom pra liberar recursos pesados.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        print("viewDidDisappear — A view saiu da tela")
    }

    // Chamado toda vez que o Auto Layout recalcula as posições.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        print("viewDidLayoutSubviews — Layout recalculado (bounds: \(view.bounds.size))")

        // CAGradientLayer não usa Auto Layout, então atualizamos o frame manualmente.
        if let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = view.bounds
        }
    }

    // Chamado quando a tela vai mudar de tamanho (ex: rotação).
    // O coordinator permite animar junto com a transição do sistema.
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(to: size, with: coordinator)

        print("viewWillTransition — Novo tamanho: \(size)")

        coordinator.animate { _ in
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - Status Bar

    // Texto branco na status bar, porque o fundo é escuro.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Setup

    // Cria o gradiente de fundo (vermelho escuro → preto) usando CAGradientLayer.
    // Fica atrás da view SwiftUI (que tem background transparente).
    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        gradientLayer.colors = [
            UIColor(red: 0.68, green: 0.19, blue: 0.15, alpha: 1.0).cgColor,
            UIColor(red: 0.16, green: 0.07, blue: 0.06, alpha: 1.0).cgColor,
            UIColor.black.cgColor
        ]

        gradientLayer.locations = [0.0, 0.35, 0.7]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    // Embute a view SwiftUI usando o padrão de Child View Controller.
    // São 3 passos obrigatórios: addChild → addSubview → didMove.
    // Pular qualquer um causa bugs sutis (rotação, lifecycle, etc).
    private func embedSwiftUIView() {
        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        // Usa leading/trailing (e não left/right) para funcionar em RTL.
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            hostingController.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            hostingController.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            hostingController.view.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])

        hostingController.didMove(toParent: self)
    }

    // Observa mudanças de size class e direção de layout (iOS 17+).
    // Substitui o antigo traitCollectionDidChange que foi descontinuado.
    private func setupTraitObservations() {
        if #available(iOS 17.0, *) {
            registerForTraitChanges(
                [UITraitHorizontalSizeClass.self, UITraitLayoutDirection.self]
            ) { (self: Self, previousTraitCollection: UITraitCollection) in
                print("traitChanges — Traits atualizados")
                print("   → Size class: \(self.traitCollection.horizontalSizeClass.description)")
                print("   → Layout direction: \(self.traitCollection.layoutDirection == .rightToLeft ? "RTL" : "LTR")")
            }
        }
    }
}

// MARK: - UIUserInterfaceSizeClass Extension

// Descrição legível do size class para os prints de debug.
extension UIUserInterfaceSizeClass {

    var description: String {
        switch self {
        case .compact:
            return "compact (iPhone portrait / tela estreita)"
        case .regular:
            return "regular (iPad / iPhone landscape)"
        case .unspecified:
            return "unspecified"
        @unknown default:
            return "unknown"
        }
    }
}
