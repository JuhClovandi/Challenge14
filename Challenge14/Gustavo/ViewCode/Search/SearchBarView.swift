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
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        icon.image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        icon.tintColor = .darkGray
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Artists, songs or podcasts", comment: "")
        label.textColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        // RTL: .natural acompanha a direção do idioma
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchIcon, placeholderLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var topPadding: NSLayoutConstraint?
    private var bottomPadding: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func scaledPadding() -> CGFloat {
        UIFontMetrics(forTextStyle: .body).scaledValue(for: 8)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            let padding = scaledPadding()
            topPadding?.constant = padding
            bottomPadding?.constant = -padding
        }
    }
}

extension SearchBarView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(contentStack)
    }
    
    func setupConstraints() {
        let padding = scaledPadding()
        
        topPadding = contentStack.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: padding)
        bottomPadding = contentStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -padding)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 45),
            
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contentStack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -12),
            contentStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            topPadding!,
            bottomPadding!
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        // VoiceOver
        isAccessibilityElement = true
        accessibilityLabel = NSLocalizedString("Search", comment: "")
        accessibilityValue = placeholderLabel.text
        accessibilityTraits = .searchField
    }
}
