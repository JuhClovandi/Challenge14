//
//  MusicPlayerCardView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

class MusicPlayerCardView: UIView {

    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "albumMatue")
        imageView.backgroundColor = .darkGray
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Conexões de Máfia"
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        // Garante que o texto seja truncado se não houver espaço
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private let artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Matuê, Rich The Kid"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    // MARK: - Stack Views

    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var titleRowStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelsStack, addButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var timeLabelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [currentTimeLabel, durationLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var progressStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [progressView, timeLabelsStack])
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var controlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [previousButton, playButton, nextButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var ipadContentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleRowStack,
            progressStack,
            controlsStack
        ])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: "backward.fill"),
            for: .normal
        )
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "1:18"
        label.font = .preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "3:53"
        label.font = .preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.35
        progress.trackTintColor = UIColor.white.withAlphaComponent(0.18)
        progress.progressTintColor = .white
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    private var defaultConstraints: [NSLayoutConstraint] = []
    private var ipadConstraints: [NSLayoutConstraint] = []
    private var albumWidthConstraint: NSLayoutConstraint?
    private var albumHeightConstraint: NSLayoutConstraint?
    private var previousWidthConstraint: NSLayoutConstraint?
    private var previousHeightConstraint: NSLayoutConstraint?

    private var nextWidthConstraint: NSLayoutConstraint?
    private var nextHeightConstraint: NSLayoutConstraint?

    private var addWidthConstraint: NSLayoutConstraint?
    private var addHeightConstraint: NSLayoutConstraint?

    private var playWidthConstraint: NSLayoutConstraint?
    private var playHeightConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError() }
    
    private func scaledImageSize() -> CGFloat {
        // Escala os 44 pontos base de acordo com o estilo headline
        return UIFontMetrics(forTextStyle: .headline).scaledValue(for: 44)
    }
    
    private func scaledPlaySize() -> CGFloat {
        return UIFontMetrics(forTextStyle: .title1).scaledValue(for: 44)
    }
    private func scaledControlButtonSize() -> CGFloat {
        UIFontMetrics(forTextStyle: .title3).scaledValue(for: 24)
    }

    private func scaledAddButtonSize() -> CGFloat {
        UIFontMetrics(forTextStyle: .title3).scaledValue(for: 24)
    }
    
    private func updateDynamicTypeLayout() {
        
        let controlPointSize = UIFontMetrics(forTextStyle: .body)
            .scaledValue(for: 18)

        let playPointSize = UIFontMetrics(forTextStyle: .title2)
            .scaledValue(for: 34)

        let controlConfig = UIImage.SymbolConfiguration(
            pointSize: controlPointSize,
            weight: .regular
        )

        let playConfig = UIImage.SymbolConfiguration(
            pointSize: playPointSize,
            weight: .regular
        )

        previousButton.setPreferredSymbolConfiguration(controlConfig, forImageIn: .normal)

        nextButton.setPreferredSymbolConfiguration(controlConfig, forImageIn: .normal)

        addButton.setPreferredSymbolConfiguration(controlConfig, forImageIn: .normal)

        playButton.setPreferredSymbolConfiguration(playConfig, forImageIn: .normal)

        albumWidthConstraint?.constant = scaledImageSize()
        albumHeightConstraint?.constant = scaledImageSize()


        playWidthConstraint?.constant = scaledPlaySize()
        playHeightConstraint?.constant = scaledPlaySize()

        invalidateIntrinsicContentSize()
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        guard traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory else {
            return
        }

        updateDynamicTypeLayout()

        layoutIfNeeded()
    }

    func configureForIpad() {
        NSLayoutConstraint.deactivate(defaultConstraints)

        // Monta hierarquia de stacks (só uma vez)
        if ipadContentStack.superview == nil {
            addSubview(ipadContentStack)
        }

        backgroundColor = .clear

        progressView.isHidden = false
        currentTimeLabel.isHidden = false
        durationLabel.isHidden = false
        previousButton.isHidden = false
        nextButton.isHidden = false
        addButton.isHidden = false
        
        addButton.setContentHuggingPriority(.required, for: .horizontal)
        addButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        labelsStack.setContentHuggingPriority(.defaultLow, for: .horizontal)
        labelsStack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        NSLayoutConstraint.activate(ipadConstraints)
    }
}

extension MusicPlayerCardView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(albumImageView)
        addSubview(labelsStack)
        addSubview(playButton)
    }

    func setupConstraints() {
        // Inicializa as constraints de tamanho da imagem com o valor escalado
        let imageSize = scaledImageSize()
        albumWidthConstraint = albumImageView.widthAnchor.constraint(equalToConstant: imageSize)
        albumHeightConstraint = albumImageView.heightAnchor.constraint(equalToConstant: imageSize)
        
        
        // IPHONE:
        defaultConstraints = [
            // Imagem presa ao topo e fundo para ditar a altura mínima
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            albumImageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            albumImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            albumWidthConstraint!,
            albumHeightConstraint!,

            // Stack de labels centralizada verticalmente e presa horizontalmente
            labelsStack.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 12),
            labelsStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStack.trailingAnchor.constraint(lessThanOrEqualTo: playButton.leadingAnchor, constant: -12),
            labelsStack.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            labelsStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),

            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            playButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
        ]

        
        // IPAD:
        playWidthConstraint = playButton.widthAnchor.constraint(
            equalToConstant: scaledPlaySize()
        )

        playHeightConstraint = playButton.heightAnchor.constraint(
            equalToConstant: scaledPlaySize()
        )

        ipadConstraints = [
            
            albumImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            albumImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor),
            
            ipadContentStack.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16),
            ipadContentStack.leadingAnchor.constraint(equalTo: albumImageView.leadingAnchor),
            ipadContentStack.trailingAnchor.constraint(equalTo: albumImageView.trailingAnchor),
            ipadContentStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -24),
            
            playWidthConstraint!,
            playHeightConstraint!,
            
            progressView.heightAnchor.constraint(greaterThanOrEqualToConstant: 4),
        ]

    }

    func applyAdditionalChanges() {
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
        
        [
            previousButton,
            playButton,
            nextButton,
            addButton
        ].forEach {
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .vertical)

            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentHuggingPriority(.required, for: .vertical)
        }
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        artistLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        updateDynamicTypeLayout()
    }
}
