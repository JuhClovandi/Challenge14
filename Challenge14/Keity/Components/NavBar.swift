//
//  NavBar.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//
import UIKit

class NavBar: UIView {
        //UIStackView - NavBarStackView
        let navBarStackView: UIStackView = {
               let view = UIStackView()
               view.axis = .horizontal
               view.distribution = .equalSpacing
               view.alignment = .center
               view.translatesAutoresizingMaskIntoConstraints = false
               return view
           }()
        
        //UIButton dentro da NavBar - voltar
        let voltarButton: UIButton = {
                let view = UIButton()
                view.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                view.tintColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
        
        
        //UIlabel dentro da NavBar - nome do album
        let nomeAlbumLabel: UILabel = {
                let view = UILabel()
                view.text = "1 (Remastered)"
                view.font = .systemFont(ofSize: 13, weight: .semibold)
                view.textColor = .white
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
        
        //UIButton dentro da NavBar - tres pontinhos
        let configButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            view.tintColor = .white
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
        addSubview(navBarStackView)
        
        navBarStackView.addArrangedSubview(voltarButton)
        navBarStackView.addArrangedSubview(nomeAlbumLabel)
        navBarStackView.addArrangedSubview(configButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
               navBarStackView.topAnchor.constraint(equalTo: topAnchor),
               navBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
               navBarStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
               navBarStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
           ])
    }

}
