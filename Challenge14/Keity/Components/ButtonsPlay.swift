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
        view.setImage(AppImages.shuffle, for: .normal)
        view.tintColor = AppColors.icon
        view.isAccessibilityElement = true
        view.accessibilityLabel = "Aleatório"
        view.accessibilityTraits = .button
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UIStackView - botao de voltar musica
    let previousButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.previous, for: .normal)
        view.tintColor = AppColors.icon
        view.isAccessibilityElement = true
        view.accessibilityLabel = "Música anterior"
        view.accessibilityTraits = .button
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UIStackView - botao de play musica
    let playPauseButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.playPause, for: .normal)
        view.tintColor = AppColors.icon
        view.isAccessibilityElement = true
        view.accessibilityLabel = "Pausar"
        view.accessibilityTraits = .button
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UIStackView - avançar musica
    let nextButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.next, for: .normal)
        view.tintColor = AppColors.icon
        view.isAccessibilityElement = true
        view.accessibilityLabel = "Próxima música"
        view.accessibilityTraits = .button
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UIStackView - repetir musica
    let repeatButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.repeatIcon, for: .normal)
        view.tintColor = AppColors.accent
        view.isAccessibilityElement = true 
        view.accessibilityLabel = "Repetir"
        view.accessibilityTraits = .button
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
        
        //forca hierarquia no Voice Over
        buttonStackView.accessibilityElements = [
                shuffleButton,
                previousButton,
                playPauseButton,
                nextButton,
                repeatButton
            ]
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
