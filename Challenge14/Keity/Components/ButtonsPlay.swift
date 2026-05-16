//
//  ButtonsPlay.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

class ButtonsPlay: UIView{
    
    //UIStackView - Buttons
    let buttonStackView: UIStackView = {
           let view = UIStackView()
           view.axis = .horizontal
           view.distribution = .equalSpacing
           view.alignment = .center
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    //UIStackView - botao de ordem aleatoria
    let shuffleButton: UIButton = {
            let view = UIButton()
            let conf = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        view.setImage(UIImage(systemName: "shuffle", withConfiguration: conf), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - botao de voltar musica
    let previousButton: UIButton = {
            let view = UIButton()
        let conf = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
            view.setImage(UIImage(systemName: "backward.end.fill", withConfiguration: conf), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - botao de play musica
    let playPauseButton: UIButton = {
            let view = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 65, weight: .regular)
            view.setImage(UIImage(systemName: "pause.circle.fill", withConfiguration: config), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - avançar musica
    let nextButton: UIButton = {
           let view = UIButton()
        let conf = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
           view.setImage(UIImage(systemName: "forward.end.fill", withConfiguration: conf), for: .normal)
           view.tintColor = .white
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    //UIStackView - repetir musica
    let repeatButton: UIButton = {
            let view = UIButton()
        let conf = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
            view.setImage(UIImage(systemName: "repeat", withConfiguration: conf), for: .normal)
            view.tintColor = .green
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
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(shuffleButton)
        buttonStackView.addArrangedSubview(previousButton)
        buttonStackView.addArrangedSubview(playPauseButton)
        buttonStackView.addArrangedSubview(nextButton)
        buttonStackView.addArrangedSubview(repeatButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
