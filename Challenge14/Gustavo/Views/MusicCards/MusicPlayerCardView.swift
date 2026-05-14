//
//  MusicPlayerCardView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

class MusicPlayerCardView: UIView {
    
    // MARK: - UI Components
    private let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .darkGray
        iv.layer.cornerRadius = 4
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let textStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 2
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .white
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Troye Sivan"
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        return label
    }()
    
    private let playButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: - Public Methods
    func configureForIpad() {
        // No iPad, a stack fica centralizada e os textos maiores
        textStackView.alignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        artistLabel.font = .preferredFont(forTextStyle: .body)
        backgroundColor = UIColor(white: 0.15, alpha: 1.0)
    }
}

extension MusicPlayerCardView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(albumImageView)
        addSubview(textStackView)
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(artistLabel)
        addSubview(playButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            albumImageView.widthAnchor.constraint(equalToConstant: 44),
            albumImageView.heightAnchor.constraint(equalToConstant: 44),
            
            textStackView.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 12),
            textStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textStackView.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -12),
            
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}
