//
//  MusicPlayerCardView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import UIKit

class MusicPlayerCardView: UIView {

    // MARK: - iPhone view

    private let iPhoneAlbumImageView = AlbumImageView()
    private let iPhoneTitleLabel = SongTitleLabel(style: .headline)
    private let iPhoneArtistLabel = SongArtistLabel()
    private let iPhonePlayButton = PlayButton()

    private lazy var iPhoneLabelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPhoneTitleLabel, iPhoneArtistLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var iPhoneContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iPhoneAlbumImageView,
            iPhoneLabelsStack,
            iPhonePlayButton
        ])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - iPad view

    private let iPadAlbumImageView = AlbumImageView()
    private let iPadTitleLabel = SongTitleLabel(style: .title3)
    private let iPadArtistLabel = SongArtistLabel()
    private let iPadPlayButton = PlayButton()
    private let iPadPreviousButton = ControlButton(systemName: "backward.fill")
    private let iPadNextButton = ControlButton(systemName: "forward.fill")
    private let iPadAddButton = ControlButton(systemName: "plus.circle")
    private let iPadProgressView = MusicProgressView()
    private let iPadCurrentTimeLabel = TimeLabel(text: "1:18")
    private let iPadDurationLabel = TimeLabel(text: "3:53", color: .lightGray)

    private lazy var iPadTitleRowStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPadLabelsStack, iPadAddButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var iPadLabelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPadTitleLabel, iPadArtistLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var iPadTimeLabelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPadCurrentTimeLabel, iPadDurationLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var iPadProgressStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPadProgressView, iPadTimeLabelsStack])
        stack.axis = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var iPadControlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iPadPreviousButton, iPadPlayButton, iPadNextButton])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var iPadContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iPadTitleRowStack,
            iPadProgressStack,
            iPadControlsStack
        ])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var iPhoneAlbumSize: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Dynamic Type

    private func scaledImageSize() -> CGFloat {
        UIFontMetrics(forTextStyle: .headline).scaledValue(for: 44)
    }

    private func scaledPlaySize() -> CGFloat {
        UIFontMetrics(forTextStyle: .title1).scaledValue(for: 48)
    }

    private func scaledControlSize() -> CGFloat {
        UIFontMetrics(forTextStyle: .body).scaledValue(for: 18)
    }

    private func updateDynamicTypeConstraints() {
        let imageSize = scaledImageSize()
        iPhoneAlbumSize?.constant = imageSize

        let controlConfig = UIImage.SymbolConfiguration(
            pointSize: scaledControlSize(), weight: .regular
        )
        
        let playConfig = UIImage.SymbolConfiguration(
            pointSize: UIFontMetrics(forTextStyle: .title2).scaledValue(for: 34),
            weight: .regular
        )

        let iPhonePlayConfig = UIImage.SymbolConfiguration(
            pointSize: UIFontMetrics(forTextStyle: .title3).scaledValue(for: 28),
            weight: .regular
        )

        // iPad buttons
        [iPadPreviousButton, iPadNextButton, iPadAddButton].forEach {
            $0.setPreferredSymbolConfiguration(controlConfig, forImageIn: .normal)
        }
        iPadPlayButton.setPreferredSymbolConfiguration(playConfig, forImageIn: .normal)

        iPhonePlayButton.setPreferredSymbolConfiguration(iPhonePlayConfig, forImageIn: .normal) // escalar com dynamic type

        setNeedsLayout()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory else { return }
        updateDynamicTypeConstraints()
    }

    // Constraints
    
    private var iPhoneConstraints: [NSLayoutConstraint] = []
    private var iPadLayoutConstraints: [NSLayoutConstraint] = []

    // iphone. Desativa ipad / Ativa constraints iphone,
    func configureForIphone() {
        NSLayoutConstraint.deactivate(iPadLayoutConstraints)
        NSLayoutConstraint.activate(iPhoneConstraints)

        iPhoneContainer.isHidden = false
        iPadAlbumImageView.isHidden = true
        iPadContainer.isHidden = true
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
    }

    // IPad. Desativa iphone / Ativa constraints ipad,
    func configureForIpad() {
        NSLayoutConstraint.deactivate(iPhoneConstraints)
        NSLayoutConstraint.activate(iPadLayoutConstraints)

        iPhoneContainer.isHidden = true
        iPadAlbumImageView.isHidden = false
        iPadContainer.isHidden = false
        backgroundColor = .clear
    }
}

extension MusicPlayerCardView: ViewCodeProtocol {

    func buildHierarchy() {
        // iPhone layout
        addSubview(iPhoneContainer)

        // iPad layout 
        addSubview(iPadAlbumImageView)
        addSubview(iPadContainer)
    }

    func setupConstraints() {
        // iPhone
        iPhoneAlbumSize = iPhoneAlbumImageView.widthAnchor.constraint(equalToConstant: 44)

        iPhoneConstraints = [
            iPhoneContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iPhoneContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iPhoneContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            iPhoneContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            iPhoneAlbumSize!,
            iPhoneAlbumImageView.heightAnchor.constraint(equalTo: iPhoneAlbumImageView.widthAnchor),
        ]

        // iPad
        iPadLayoutConstraints = [
            iPadAlbumImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            iPadAlbumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iPadAlbumImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            iPadAlbumImageView.heightAnchor.constraint(equalTo: iPadAlbumImageView.widthAnchor),
            iPadContainer.topAnchor.constraint(equalTo: iPadAlbumImageView.bottomAnchor, constant: 16),
            iPadContainer.leadingAnchor.constraint(equalTo: iPadAlbumImageView.leadingAnchor),
            iPadContainer.trailingAnchor.constraint(equalTo: iPadAlbumImageView.trailingAnchor),
            iPadContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            iPadProgressView.heightAnchor.constraint(greaterThanOrEqualToConstant: 4),
            iPadAddButton.widthAnchor.constraint(equalToConstant: 28),
            iPadAddButton.heightAnchor.constraint(equalToConstant: 28),
        ]
    }

    func applyAdditionalChanges() {
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false

        // Prioridades de layout para iPhone: texto cede espaço, play e imagem não cedem
        iPhoneLabelsStack.setContentHuggingPriority(.defaultLow, for: .horizontal)
        iPhoneLabelsStack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        iPhoneTitleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        iPhoneArtistLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        iPhonePlayButton.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        iPhonePlayButton.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        iPhoneAlbumImageView.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        iPhoneAlbumImageView.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)

        configureForIphone()

        updateDynamicTypeConstraints()
    }
}

// Views

private final class AlbumImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    convenience init() { self.init(frame: .zero) }
    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        image = UIImage(named: "albumMatue")
        backgroundColor = .darkGray
        layer.cornerRadius = 4
        clipsToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}

private final class SongTitleLabel: UILabel {
    init(style: UIFont.TextStyle) {
        super.init(frame: .zero)
        text = "Conexões de Máfia"
        font = .preferredFont(forTextStyle: style)
        adjustsFontForContentSizeCategory = true
        textColor = .white
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) { fatalError() }
}

private final class SongArtistLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    convenience init() { self.init(frame: .zero) }
    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        text = "Matuê, Rich The Kid"
        font = .preferredFont(forTextStyle: .subheadline)
        adjustsFontForContentSizeCategory = true
        textColor = .lightGray
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

private final class PlayButton: UIButton {
    init() {
        super.init(frame: .zero)
        setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        // setPreferredSymbolConfiguration permite que o sistema re-escale automaticamente
        let config = UIImage.SymbolConfiguration(textStyle: .title3)
        setPreferredSymbolConfiguration(config, forImageIn: .normal)
        imageView?.contentMode = .scaleAspectFit
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) { fatalError() }
}

private final class ControlButton: UIButton {
    init(systemName: String) {
        super.init(frame: .zero)
        setImage(UIImage(systemName: systemName), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) { fatalError() }
}

private final class MusicProgressView: UIProgressView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    convenience init() { self.init(frame: .zero) }
    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        progress = 0.35
        trackTintColor = UIColor.white.withAlphaComponent(0.18)
        progressTintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}

private final class TimeLabel: UILabel {
    init(text: String, color: UIColor = .white) {
        super.init(frame: .zero)
        self.text = text
        font = .preferredFont(forTextStyle: .caption2)
        adjustsFontForContentSizeCategory = true
        textColor = color
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) { fatalError() }
}
