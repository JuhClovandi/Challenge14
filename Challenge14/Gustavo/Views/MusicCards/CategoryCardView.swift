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
        // TextStyle garante que a Apple gerencie o tamanho base
        let font = UIFont.preferredFont(forTextStyle: .title3)
        // Bold customizado que respeita o Dynamic Type
        label.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: .systemFont(ofSize: 20, weight: .bold))
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let albumImage: UIImageView = {
        let album = UIImageView()
        album.contentMode = .scaleAspectFill
        album.clipsToBounds = true
        album.layer.cornerRadius = 12
        album.translatesAutoresizingMaskIntoConstraints = false
        // rotação
        album.transform = CGAffineTransform(rotationAngle: 0.4)
        return album
    }()
    
    // customizar o init
    
    init(title: String, color: UIColor, image: UIImage?){
        super.init(frame: .zero)
        titleLabel.text = title
        albumImage.image = image ?? UIImage(named: "albumVazio")
        backgroundColor = color
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCardView: ViewCodeProtocol{
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(albumImage)
    }
    
    func setupConstraints() {
            // Usamos multiplicadores para que a imagem seja sempre proporcional ao card
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

                albumImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
                albumImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
                albumImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
                albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor)
            ])
        }
    
    func applyAdditionalChanges() {
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}
