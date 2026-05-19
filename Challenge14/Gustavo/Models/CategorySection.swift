//
//  Category.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

struct Category{
    let title: String
    let color: UIColor
    let image: UIImage?
}

struct CategorySection {
    let title: String
    let items: [Category]
}

let mockSections: [CategorySection] = [
    CategorySection(title: NSLocalizedString("Your top genres", comment: ""), items: [
        Category(title: NSLocalizedString("Pop", comment: ""), color: .systemPurple, image: nil),
        Category(title: NSLocalizedString("Indie", comment: ""), color: .systemGreen, image: nil),
    ]),
    CategorySection(title: NSLocalizedString("Browse all", comment: ""), items: [
        Category(title: NSLocalizedString("News & Politics", comment: ""), color: .systemBlue, image: nil),
        Category(title: NSLocalizedString("Podcasts", comment: ""), color: .systemIndigo, image: nil),
        Category(title: NSLocalizedString("Comedy", comment: ""), color: .systemOrange, image: nil),
        Category(title: NSLocalizedString("2021 Wrapped", comment: ""), color: .systemTeal, image: nil),
        Category(title: NSLocalizedString("Made For You", comment: ""), color: .systemMint, image: UIImage(named: "albumMatue")),
        Category(title: NSLocalizedString("Charts", comment: ""), color: .systemPink, image: nil),
    ])
]
 
