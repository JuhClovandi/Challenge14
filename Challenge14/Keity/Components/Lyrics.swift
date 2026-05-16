//
//  Lyrics.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

class Lyrics: UIView {
    
    //UIStackView - Container texto da Letra Musica
    let textLetraMusica: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UILabel- letra da muisca
    let letraLabel: UILabel = {
        let view = UILabel()
        view.text = "Lyrics"
        view.font = AppFonts.lyrics
        view.textColor = AppColors.primaryText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHierarchy(){
        addSubview(textLetraMusica)
        textLetraMusica.addArrangedSubview(letraLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            textLetraMusica.topAnchor.constraint(equalTo: topAnchor),
            textLetraMusica.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLetraMusica.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLetraMusica.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

