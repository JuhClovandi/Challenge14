//
//  HeaderSearch.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 14/05/26.
//

import Foundation
import UIKit


class HeaderSearchView: UIView{
    var onCameraTapped: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        if let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1).withSymbolicTraits(.traitBold) {
            label.font = UIFont(descriptor: descriptor, size: 0) // size 0 mantém o tamanho dinâmico do estilo
        }
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cameraButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .title1, scale: .medium)
        button.setImage(UIImage(systemName: "camera", withConfiguration: config), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        cameraButton.addTarget(self, action: #selector(cameraTapped), for: .touchUpInside)
    }
    
    @objc private func cameraTapped() {
        onCameraTapped?()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderSearchView: ViewCodeProtocol{
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(cameraButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            
            cameraButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cameraButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cameraButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 56),
            cameraButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 56),
        ])
    }
    
    func applyAdditionalChanges() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
