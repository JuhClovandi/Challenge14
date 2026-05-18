//
//  Footer.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

class FooterView: UIView {
    
    let footerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Stack horizontal: ícone bluetooth + label
    let bluetoothContainerStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   //button de bluetooth
    let bluetoothButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.bluetooth, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
      
        return view
    }()
    
    let textBluetooth: UILabel = {
        let label = UILabel()
        label.text = "BEATSPILL+"
        label.font = AppFonts.bluetooth
        label.textColor = AppColors.destach
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Stack horizontal: share + list
    let rightButtonsStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //button de compartilhar
    let sharedButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.share, for: .normal)
        view.tintColor = AppColors.icon
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //butto de list
    let listButton: UIButton = {
        let view = UIButton()
        view.setImage(AppImages.list, for: .normal)
        view.tintColor = AppColors.icon
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
        addSubview(footerStackView)
        // bluetooth + texto juntos (vertical)
        bluetoothContainerStack.addArrangedSubview(bluetoothButton)
        bluetoothContainerStack.addArrangedSubview(textBluetooth)
        
        // botões da direita
        rightButtonsStack.addArrangedSubview(sharedButton)
        rightButtonsStack.addArrangedSubview(listButton)

        footerStackView.addArrangedSubview(bluetoothContainerStack)
        footerStackView.addArrangedSubview(rightButtonsStack)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            footerStackView.topAnchor.constraint(equalTo: topAnchor),
            footerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
