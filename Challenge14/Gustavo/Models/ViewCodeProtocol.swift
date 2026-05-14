//
//  ViewCodeProtocol.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

protocol ViewCodeProtocol {
    func buildHierarchy()   // elementos (addSubview)
    func setupConstraints() // tamanho e posição (Auto Layout)
    func applyAdditionalChanges() // Configurações extras (cores, delegados, etc)
    func setupView() 
}

// Toda classe que assinar ViewCode ganhará o setupView automaticamente.
extension ViewCodeProtocol {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
