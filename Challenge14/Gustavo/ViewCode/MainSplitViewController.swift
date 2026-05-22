//
//  MainSplitViewController.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 14/05/26.
//

import Foundation
import UIKit

class MainSplitViewController: UISplitViewController {
    
    private let musicPlayer = MusicPlayerCardView()
    
    init() {
            super.init(style: .doubleColumn)
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplitView()
    }
    
    private func setupSplitView() {
        self.preferredDisplayMode = .oneBesideSecondary
        self.preferredSplitBehavior = .tile
        
        let sidebarVC = UIViewController()
        
        let searchVC = SearchViewController()
        let detailNav = UINavigationController(rootViewController: searchVC)
        
        self.setViewController(sidebarVC, for: .primary)
        self.setViewController(detailNav, for: .secondary)
        self.setViewController(detailNav, for: .compact)
        
        // Se estiver no iPad, configura o player na sidebar
        if traitCollection.horizontalSizeClass == .regular {
            setupIpadPlayer(in: sidebarVC.view)
        }
    }
    
    private func setupIpadPlayer(in container: UIView) {
        container.addSubview(musicPlayer)
        musicPlayer.configureForIpad()
        
        NSLayoutConstraint.activate([
                musicPlayer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                musicPlayer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
                musicPlayer.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                musicPlayer.heightAnchor.constraint(greaterThanOrEqualToConstant: 500)
            ])
    }
}
