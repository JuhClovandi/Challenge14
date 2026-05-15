//
//  SectionHeaderView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 14/05/26.
//

import Foundation
import UIKit

class SectionHeaderView: UICollectionReusableView{
    static let reuseIdentifier: String = "SectionHeader"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title2).withSymbolicTraits(.traitBold) {
                label.font = UIFont(descriptor: descriptor, size: 0) // size 0 mantém o tamanho dinâmico do estilo
            }
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
