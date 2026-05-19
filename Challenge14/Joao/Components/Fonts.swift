//
//  FOnts.swift
//  Challenge14
//
//  Created by Wise on 18/05/26.
//

import UIKit

let spotifyFont: [UIFont.TextStyle: UIFont] = [
    .largeTitle: UIFont(name: "Avenir-Next-Bold", size: 24)!,
    .title1: UIFont(name: "Avenir-Next-Bold", size: 19)!,
    .body: UIFont(name: "Avenir-Next-Demi-Bold", size: 12)!,
    .callout: UIFont(name: "Avenir-Next", size: 10)!
]

extension UIFont {
     class func customFont(for textStyle: UIFont.TextStyle) -> UIFont {
        let spotifyFont = spotifyFont[textStyle]!
        let metrics = UIFontMetrics(forTextStyle: textStyle)
        let scaledFont = metrics.scaledFont(for: spotifyFont)
        return scaledFont
    }
}
