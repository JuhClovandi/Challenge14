//
//  SearchBarView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

class SearchBarView: UIView {
    
    private let searchIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "magnifyingglass")
        icon.tintColor = .darkGray
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Artists, songs or podcasts"
        label.textColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchBarView : ViewCodeProtocol{
    func buildHierarchy() {
        addSubview(searchIcon)
        addSubview(placeholderLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45), //altura fixa da barra
            
            // icon na esquerda
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            // placeholder
            placeholderLabel.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 8),
            placeholderLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
