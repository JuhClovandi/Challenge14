//
//  Category.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

struct CategorySection{
    let title: String
    let color: UIColor
    let image: UIImage?
}

let mockCategories: [CategorySection] = [
    CategorySection(title: "Pop", color: .systemPurple, image: nil),
    CategorySection(title: "Indie", color: .systemGreen, image: nil),
    CategorySection(title: "News & Politics", color: .systemBlue, image: nil),
    CategorySection(title: "Comedy", color: .systemOrange, image: nil),
    CategorySection(title: "2021 Wraped", color: .systemTeal, image: nil),
    CategorySection(title: "Podcasts", color: .systemIndigo, image: nil),
    CategorySection(title: "Made For you", color: .systemMint, image: UIImage(named: "albumMatue")),
    CategorySection(title: "Charts", color: .systemPink, image: nil),
    
]
 
