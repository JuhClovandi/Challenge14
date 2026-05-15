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
    CategorySection(title: "Your top genres", items: [
        Category(title: "Pop", color: .systemPurple, image: nil),
        Category(title: "Indie", color: .systemGreen, image: nil),
    ]),
    CategorySection(title: "Browse all", items: [
        Category(title: "News & Politics", color: .systemBlue, image: nil),
        Category(title: "Podcasts", color: .systemIndigo, image: nil),
        Category(title: "Comedy", color: .systemOrange, image: nil),
        Category(title: "2021 Wrapped", color: .systemTeal, image: nil),
        Category(title: "Made For You", color: .systemMint, image: UIImage(named: "albumMatue")),
        Category(title: "Charts", color: .systemPink, image: nil),
    ])
]
 
