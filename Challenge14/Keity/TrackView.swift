//
//  TrackView.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 14/05/26.
//

import UIKit

class TrackView: UIView {
    
    // Subviews
    let navBar = NavBar()
    let capa = Capa()
    let infoRow = InfoRow()
    let progress = ProgressBar()
    let buttonsPlay = ButtonsPlay()
    let footer = FooterView()
    let lyrics = Lyrics()
    
    
    //MARK: CONECTANDO MODULOS DA VIEW
    override init(frame: CGRect){
        super.init(frame: frame)
        setupBackground()
        setupHierarchy()
        setupConstraints()
        
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    //so pra definir cor fundo
    private func setupBackground(){
        backgroundColor = .gray
    }
    
    //hierarquia dos módulos
    ///views soltas na root → addSubview()
    /// views dentro de UIStackView → addArrangedSubview()
    private func setupHierarchy(){
        //NavBar
        addSubview(navBar)
        //ImageView
        addSubview(capa)
        //RowStackView
        addSubview(infoRow)
        //ProgressBar
        addSubview(progress)
        //Buttons play
        addSubview(buttonsPlay)
        //footer de tres buttons
        addSubview(footer)
        //Letra da musica
        addSubview(lyrics)
        
        
    }
//        .topAnchor       → de onde começa pelo topo
//        .leadingAnchor   → margem esquerda
//        .trailingAnchor  → margem direita
//        .heightAnchor    → altura fixa
//        .widthAnchor     → largura fixa
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // NAVBAR
            navBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            navBar.heightAnchor.constraint(equalToConstant: 44),

            // CAPA — proporcional, quadrada
            capa.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24),
            capa.centerXAnchor.constraint(equalTo: centerXAnchor),
            capa.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.88),
            capa.heightAnchor.constraint(equalTo: capa.widthAnchor),

            // ROWSTACKVIEW (info + Like)
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
            
            buttonsPlay.playPauseButton.widthAnchor.constraint(equalToConstant: 80),
            buttonsPlay.playPauseButton.heightAnchor.constraint(equalToConstant: 80),

           
            //FooterStackView
            footer.topAnchor.constraint(equalTo: buttonsPlay.bottomAnchor, constant: 24),
            footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            footer.heightAnchor.constraint(equalToConstant: 60),
            
            footer.bluetoothButton.heightAnchor.constraint(equalToConstant: 30),
            footer.bluetoothButton.widthAnchor.constraint(equalToConstant: 30),
            
        
            // LETRA
            lyrics.topAnchor.constraint(equalTo: footer.bottomAnchor, constant: 16),
            lyrics.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lyrics.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            lyrics.heightAnchor.constraint(equalToConstant: 50),
            lyrics.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

}
