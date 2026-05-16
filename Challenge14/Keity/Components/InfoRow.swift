//
//  InfoRow.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

class InfoRow: UIView {
    //MARK: RowStackView
    let rowStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: INFOSTACKVIEW
    //UIStackView - InfoStackView
    let infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UILabel titulo musica dentro da InfoStackView
    let tituloMusicaLabel: UILabel = {
        let view = UILabel()
        view.text = "From Me to You"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UILabel nome Cantor dentro da InfoStackView
    let nomeCantorLabel: UILabel = {
        let view = UILabel()
        view.text = "The Beatles"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //InfoStackView - button de like
    let likeButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "heart"), for: .normal)
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
       addSubview(rowStackView)
        rowStackView.addArrangedSubview(infoStackView)
        rowStackView.addArrangedSubview(likeButton)
        
        infoStackView.addArrangedSubview(tituloMusicaLabel)
        infoStackView.addArrangedSubview(nomeCantorLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            rowStackView.topAnchor.constraint(equalTo: topAnchor),
            rowStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rowStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rowStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
