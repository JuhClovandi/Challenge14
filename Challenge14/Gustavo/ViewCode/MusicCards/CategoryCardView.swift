//
//  CategoryCardView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

// componente de ui puro
class CategoryCardView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: .systemFont(ofSize: 20, weight: .bold))
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.numberOfLines = 0
        // RTL: .natural acompanha a direção do idioma automaticamente
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let albumImage: UIImageView = {
        let album = UIImageView()
        album.contentMode = .scaleAspectFill
        album.clipsToBounds = true
        album.layer.cornerRadius = 12
        album.translatesAutoresizingMaskIntoConstraints = false
        // RTL: a rotação será aplicada em applyAdditionalChanges respeitando a direção
        return album
    }()
    
    private var imageWidthConstraint: NSLayoutConstraint?
    
    // customizar o init
    
    init(title: String, color: UIColor, image: UIImage?){
        super.init(frame: .zero)
        titleLabel.text = title
        albumImage.image = image ?? UIImage(named: "albumVazio")
        backgroundColor = color
        setupView()
        setupTraitObservers()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTraitObservers() {
        // 1. Escuta mudanças no Dynamic Type de forma isolada
        // O primeiro parâmetro do bloco (card) mapeia a própria instância de forma segura
        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (card: Self, previousTraitCollection: UITraitCollection) in
            card.updateImageConstraints()
        }
        
        // 2. Escuta mudanças na direção do layout (RTL / LTR)
        registerForTraitChanges([UITraitLayoutDirection.self]) { (card: Self, previousTraitCollection: UITraitCollection) in
            card.applyImageRotation()
        }
    }

    // RTL: rotação simétrica — espelha em RTL para manter a sensação visual correta
    private func applyImageRotation() {
        let angle: CGFloat = effectiveUserInterfaceLayoutDirection == .rightToLeft ? -0.4 : 0.4
        albumImage.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    private func updateImageConstraints() {
        let isAccessibility = traitCollection.preferredContentSizeCategory.isAccessibilityCategory
        // Se for acessibilidade, a imagem fica menor (25%), senão volta ao padrão (40%)
        let multiplier: CGFloat = isAccessibility ? 0.25 : 0.4
        
        imageWidthConstraint?.isActive = false
        imageWidthConstraint = albumImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier)
        imageWidthConstraint?.isActive = true
        
        layoutIfNeeded()
    }
}

extension CategoryCardView: ViewCodeProtocol{
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(albumImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            // RTL: a imagem está anchorada ao trailingAnchor do card e ao trailingAnchor do título.
            // Em LTR: título à esquerda, imagem à direita.
            // Em RTL: UIKit espelha automaticamente — título à direita, imagem à esquerda.
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: albumImage.leadingAnchor, constant: -8),

            // A MÁGICA: O fundo do card deve estar sempre abaixo do texto (com margem)
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),

            albumImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
            albumImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor)
        ])

        // Aplica a largura inicial correta
        updateImageConstraints()
    }

    func applyAdditionalChanges() {
        layer.cornerRadius = 4
        clipsToBounds = true
        // RTL: aplica a rotação correta para a direção inicial da interface
        applyImageRotation()
        
        // VoiceOver: O card deve ser lido como um botão único
        isAccessibilityElement = true
        accessibilityLabel = titleLabel.text
        accessibilityTraits = .button
    }
}
