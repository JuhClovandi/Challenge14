//
//  CapaView.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 16/05/26.
//

import UIKit

class Capa: UIView {

    //UIImageView do Album
    let capaMusicaView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray4
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false// é obrigatório, sem ele o Auto Layout não funciona.
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        clipsToBounds = true
        setupHierarchy()
        setupConstraints()   
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHierarchy(){
        addSubview(capaMusicaView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            capaMusicaView.topAnchor.constraint(equalTo: topAnchor),
            capaMusicaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            capaMusicaView.trailingAnchor.constraint(equalTo: trailingAnchor),
            capaMusicaView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
