//
//  TrackView.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 14/05/26.
//
import UIKit

class TrackView: UIView {
    
    let navBar = NavBar()
    let capa = Capa()
    let infoRow = InfoRow()
    let progress = ProgressBar()
    let buttonsPlay = ButtonsPlay()
    let footer = FooterView()
    let lyrics = Lyrics()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        setupHierarchy()
        setupConstraints()
    }
    
    private var capaWidthConstraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupBackground() {
        backgroundColor = AppColors.background
    }
    
    private func setupHierarchy() {
        addSubview(navBar)
        addSubview(capa)
        addSubview(infoRow)
        addSubview(progress)
        addSubview(buttonsPlay)
        addSubview(footer)
        addSubview(lyrics)
    }
    
    private func setupConstraints() {
        let widthConstraint = capa.widthAnchor.constraint(equalToConstant: 0)
        capaWidthConstraint = widthConstraint
        
        NSLayoutConstraint.activate([
            // NAVBAR
            navBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            
            // CAPA
            capa.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24),
            capa.centerXAnchor.constraint(equalTo: centerXAnchor),
            widthConstraint,
            capa.heightAnchor.constraint(equalTo: capa.widthAnchor),
            
            // INFO ROW
            infoRow.topAnchor.constraint(equalTo: capa.bottomAnchor, constant: 24),
            infoRow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            infoRow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            infoRow.heightAnchor.constraint(equalToConstant: 50),
            
            // PROGRESS BAR
            progress.topAnchor.constraint(equalTo: infoRow.bottomAnchor, constant: 16),
            progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            // BOTOES PLAY
            buttonsPlay.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 24),
            buttonsPlay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonsPlay.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonsPlay.heightAnchor.constraint(equalToConstant: 64),
            
            // FOOTER
            footer.topAnchor.constraint(equalTo: buttonsPlay.bottomAnchor, constant: 24),
            footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            footer.heightAnchor.constraint(equalToConstant: 60),
            footer.bluetoothButton.heightAnchor.constraint(equalToConstant: 30),
            footer.bluetoothButton.widthAnchor.constraint(equalToConstant: 30),
            
            // LYRICS
            lyrics.topAnchor.constraint(equalTo: footer.bottomAnchor, constant: 16),
            lyrics.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lyrics.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            lyrics.heightAnchor.constraint(equalToConstant: 50),
            lyrics.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCapaLayout()
    }
    
//    override func updateConstraints() {
//        // ajustar constraints dinâmicas
//        super.updateConstraints()
//    }
    
    private func updateCapaLayout() {
        let isLandscape = bounds.width > bounds.height
        let availableWidth = max(bounds.width - 64, 0)
        print(" bounds: \(bounds), isLandscape: \(isLandscape), imageWidth: \(isLandscape ? availableWidth * 0.30 : availableWidth * 0.88)")
        // portrait: largura quase total, landscape: pequena à esquerda
            capaWidthConstraint?.constant = isLandscape ? availableWidth * 0.30 : availableWidth * 0.88
    
    }
    
    
}
