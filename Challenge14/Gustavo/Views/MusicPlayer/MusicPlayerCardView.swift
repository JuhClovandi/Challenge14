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
        return label
    }()

    private let artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Matuê, Rich The Kid"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()

    private let previousButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let playButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let addButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError() }

    func configureForIpad() {
        NSLayoutConstraint.deactivate(defaultConstraints)
        NSLayoutConstraint.activate(ipadConstraints)
        backgroundColor = .clear

        // No iPhone os tempos e barra ficam escondidos na barra pequena
        progressView.isHidden = false
        currentTimeLabel.isHidden = false
        durationLabel.isHidden = false
        previousButton.isHidden = false
        nextButton.isHidden = false
        addButton.isHidden = false
        
        playButton.tintColor = .black
         playButton.backgroundColor = .white
         playButton.layer.cornerRadius = 28
         playButton.clipsToBounds = true
    }
}

extension MusicPlayerCardView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(albumImageView)
        addSubview(titleLabel)
        addSubview(artistLabel)
        addSubview(addButton)
        addSubview(currentTimeLabel)
        addSubview(durationLabel)
        addSubview(progressView)
        addSubview(previousButton)
        addSubview(playButton)
        addSubview(nextButton)
    }

    func setupConstraints() {
        // IPHONE:
        defaultConstraints = [
            albumImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 8
            ),
            albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            albumImageView.widthAnchor.constraint(equalToConstant: 44),
            albumImageView.heightAnchor.constraint(equalToConstant: 44),

            titleLabel.leadingAnchor.constraint(
                equalTo: albumImageView.trailingAnchor,
                constant: 12
            ),
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor),

            artistLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),

            playButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 32),
            playButton.heightAnchor.constraint(equalToConstant: 32),
        ]

        // IPAD:
        ipadConstraints = [

            // ALBUM 
            albumImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 24
            ),
            albumImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            albumImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -12
            ),
            albumImageView.heightAnchor.constraint(
                equalTo: albumImageView.widthAnchor  // quadrada
            ),

            // TÍTULO 
            titleLabel.topAnchor.constraint(
                equalTo: albumImageView.bottomAnchor,
                constant: 16
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: albumImageView.leadingAnchor
            ),
            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: addButton.leadingAnchor,
                constant: -8
            ),

            // BOTÃO +
            addButton.centerYAnchor.constraint(
                equalTo: titleLabel.centerYAnchor
            ),
            addButton.trailingAnchor.constraint(
                equalTo: albumImageView.trailingAnchor
            ),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            addButton.heightAnchor.constraint(equalToConstant: 28),

            // ARTISTA 
            artistLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 4
            ),
            artistLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),

            // PROGRESS VIEW
            progressView.topAnchor.constraint(
                equalTo: artistLabel.bottomAnchor,
                constant: 16
            ),
            progressView.leadingAnchor.constraint(
                equalTo: albumImageView.leadingAnchor
            ),
            progressView.trailingAnchor.constraint(
                equalTo: albumImageView.trailingAnchor
            ),

            // TEMPO ATUAL
            currentTimeLabel.topAnchor.constraint(
                equalTo: progressView.bottomAnchor,
                constant: 6
            ),
            currentTimeLabel.leadingAnchor.constraint(
                equalTo: progressView.leadingAnchor
            ),

            // DURAÇÃO TOTAL
            durationLabel.centerYAnchor.constraint(
                equalTo: currentTimeLabel.centerYAnchor
            ),
            durationLabel.trailingAnchor.constraint(
                equalTo: progressView.trailingAnchor
            ),

            // PLAY
            playButton.topAnchor.constraint(
                equalTo: currentTimeLabel.bottomAnchor,
                constant: 20
            ),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 56),
            playButton.heightAnchor.constraint(equalToConstant: 56),

            // PREVIOUS
            previousButton.centerYAnchor.constraint(
                equalTo: playButton.centerYAnchor
            ),
            previousButton.trailingAnchor.constraint(
                equalTo: playButton.leadingAnchor,
                constant: -36
            ),
            previousButton.widthAnchor.constraint(equalToConstant: 32),
            previousButton.heightAnchor.constraint(equalToConstant: 32),

            // NEXT
            nextButton.centerYAnchor.constraint(
                equalTo: playButton.centerYAnchor
            ),
            nextButton.leadingAnchor.constraint(
                equalTo: playButton.trailingAnchor,
                constant: 36
            ),
            nextButton.widthAnchor.constraint(equalToConstant: 32),
            nextButton.heightAnchor.constraint(equalToConstant: 32),
        ]

        NSLayoutConstraint.activate(defaultConstraints)
        [
            progressView, currentTimeLabel, durationLabel, previousButton,
            nextButton, addButton,
        ].forEach { $0.isHidden = true }

    }

    func applyAdditionalChanges() {
        backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}
