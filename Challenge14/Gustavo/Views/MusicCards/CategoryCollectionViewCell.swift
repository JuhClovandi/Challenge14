//
//  CategoryCollectionViewCell.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

// vai segurar o card e garantir que vai ocupar o espaço da célula
class CategoryCollectionViewCell: UICollectionViewCell {
    private var cardView: CategoryCardView?
    
    func setup(title: String, color: UIColor, image: UIImage?){
        cardView?.removeFromSuperview()
        
        let newCard = CategoryCardView(title: title, color: color, image: image)
        newCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newCard)
        self.cardView = newCard
        
        NSLayoutConstraint.activate([
            newCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            newCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
