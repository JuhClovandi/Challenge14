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
    private var capaTopConstraint: NSLayoutConstraint?
    private var infoRowTopConstraint: NSLayoutConstraint?
    private var progressTopConstraint: NSLayoutConstraint?
    private var buttonsPlayTopConstraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupBackground() {
        backgroundColor = AppColors.background
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(navBar)
        contentView.addSubview(capa)
        contentView.addSubview(infoRow)
        contentView.addSubview(progress)
        contentView.addSubview(buttonsPlay)
        contentView.addSubview(footer)
        contentView.addSubview(lyrics)

    }
    
    private func setupConstraints() {
        let widthConstraint = capa.widthAnchor.constraint(equalToConstant: 0)
        capaWidthConstraint = widthConstraint
        
        // CAPA
        let capaTop = capa.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24)
        capaTopConstraint = capaTop

        // INFO ROW
        let infoTop = infoRow.topAnchor.constraint(equalTo: capa.bottomAnchor, constant: 24)
        infoRowTopConstraint = infoTop

        // PROGRESS BAR
        let progressTop = progress.topAnchor.constraint(equalTo: infoRow.bottomAnchor, constant: 16)
        progressTopConstraint = progressTop

        // BOTOES PLAY
        let buttonsTop = buttonsPlay.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 24)
        buttonsPlayTopConstraint = buttonsTop
        
        NSLayoutConstraint.activate([
            
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // CONTENTVIEW — mesma largura do scroll (só rola vertical)
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            // NAVBAR
            navBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            navBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            navBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            
            // CAPA
            capaTop,
            capa.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            widthConstraint,
            capa.heightAnchor.constraint(equalTo: capa.widthAnchor),
            capa.heightAnchor.constraint(lessThanOrEqualToConstant: 320), // máximo absoluto
            
            // INFO ROW
            infoTop,
            infoRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            infoRow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            infoRow.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            // PROGRESS BAR
            progressTop,
            progress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            progress.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            // BOTOES PLAY
            buttonsTop,
            buttonsPlay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            buttonsPlay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            buttonsPlay.heightAnchor.constraint(equalToConstant: 64),
            
            // FOOTER
            footer.topAnchor.constraint(equalTo: buttonsPlay.bottomAnchor, constant: 24),
            footer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            footer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            footer.heightAnchor.constraint(equalToConstant: 60),
            footer.bluetoothButton.heightAnchor.constraint(equalToConstant: 30),
            footer.bluetoothButton.widthAnchor.constraint(equalToConstant: 30),
            
            // LYRICS — bottomAnchor fecha o contentView (essencial pro scroll saber o tamanho)
            lyrics.topAnchor.constraint(equalTo: footer.bottomAnchor, constant: 16),
            lyrics.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            lyrics.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            lyrics.heightAnchor.constraint(equalToConstant: 50),
            lyrics.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
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
        
        // Calcula altura disponível descontando os elementos abaixo da capa
            // navBar(44) + gaps + infoRow(~50) + progress(~20) + buttonsPlay(64) + footer(60) + lyrics(50)
            let fixedElementsHeight: CGFloat = isLandscape ? 180 : 340
            let availableHeightForCapa = max(bounds.height - fixedElementsHeight, 100)

            let percentWidth = isLandscape ? availableWidth * 0.20 : availableWidth * 0.88
            
            // Capa nunca maior que o espaço vertical disponível
            capaWidthConstraint?.constant = min(percentWidth, availableHeightForCapa)
        
        // Espaçamentos comprimidos no landscape
            capaTopConstraint?.constant      = isLandscape ? 8  : 24
            infoRowTopConstraint?.constant   = isLandscape ? 8  : 24
            progressTopConstraint?.constant  = isLandscape ? 6  : 16
            buttonsPlayTopConstraint?.constant = isLandscape ? 8 : 24
        
    }
    
    
}
