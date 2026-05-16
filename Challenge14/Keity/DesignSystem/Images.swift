//
//  Images.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

enum AppImages {

    private static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    private static var smallConf: UIImage.SymbolConfiguration {
        isIPad
            ? UIImage.SymbolConfiguration(textStyle: .title2)
            : UIImage.SymbolConfiguration(textStyle: .body)
    }
    private static var mediumConf: UIImage.SymbolConfiguration {
        isIPad
        ? UIImage.SymbolConfiguration(textStyle: .title3, scale: .large)
            : UIImage.SymbolConfiguration(textStyle: .body)
    }

    private static var largeConf: UIImage.SymbolConfiguration {
        isIPad
            ? UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
            : UIImage.SymbolConfiguration(textStyle: .title1)
    }

    private static var extraLargeConf: UIImage.SymbolConfiguration {
        isIPad
            ? UIImage.SymbolConfiguration(pointSize: 100, weight: .regular)
            : UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
    }

    // Imagens do Assets
    static let capa      = UIImage(named: "CapaBeatles")
    static let bluetooth = UIImage(named: "bluetooth")

    // NavBar
    static let chevronDown = UIImage(systemName: "chevron.down", withConfiguration: smallConf)
    static let ellipsis    = UIImage(systemName: "ellipsis",      withConfiguration: smallConf)

    // InfoRow
    static let heart = UIImage(systemName: "heart", withConfiguration: mediumConf)

    // PlayerControls
    static let shuffle    = UIImage(systemName: "shuffle",           withConfiguration: mediumConf)
    static let previous   = UIImage(systemName: "backward.end.fill", withConfiguration: largeConf)
    static let playPause  = UIImage(systemName: "pause.circle.fill", withConfiguration: extraLargeConf)
    static let next       = UIImage(systemName: "forward.end.fill",  withConfiguration: largeConf)
    static let repeatIcon = UIImage(systemName: "repeat",            withConfiguration: mediumConf)

    // Footer
    static let share = UIImage(systemName: "square.and.arrow.up", withConfiguration: smallConf)
    static let list  = UIImage(systemName: "list.bullet",          withConfiguration: smallConf)
}
