//
//  ArtistsViewController.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import Foundation
import UIKit

class ArtistsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Ativa o layout dinâmico
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero // Desativa o tamanho automático do Storyboard para usarmos o cálculo abaixo
        }
        
        // Avisa o app para redesenhar o grid caso o usuário mude o tamanho da fonte do sistema
        NotificationCenter.default.addObserver(collectionView!, selector: #selector(UICollectionView.reloadData), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockArtists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath) as! ArtistCollectionViewCell
        
        let artist = mockArtists[indexPath.item]
        
        cell.nameLabel.text =  artist.name
        cell.artistImageView.image = UIImage(named: artist.imageName) ?? UIImage(systemName: "person.circle.fill")
        cell.artistImageView.tintColor = .darkGray
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout (O segredo da responsividade)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 1. Escala o espaçamento conforme o Dynamic Type
            let spacing = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16)
            let totalHorizontalPadding = spacing * 2
            
            // 2. Define uma largura mínima realista para a célula crescer junto com a fonte
            let baseMinWidth: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 140 : 95
            let minCellWidth = UIFontMetrics(forTextStyle: .body).scaledValue(for: baseMinWidth)
            
            // 3. Calcula dinamicamente quantas colunas cabem perfeitamente na largura atual da tela
            let availableWidthForCells = collectionView.frame.width - totalHorizontalPadding
            
            // Garante no mínimo 1 coluna para evitar divisão por zero se a fonte for colossal
            var numberOfColumns = floor((availableWidthForCells + spacing) / (minCellWidth + spacing))
            numberOfColumns = max(1, numberOfColumns)
            
            // Se não estiver em modo de acessibilidade extrema, respeita o teto de design (3 no iPhone, 5 no iPad)
            let maxColumns: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 5 : 3
            numberOfColumns = min(maxColumns, numberOfColumns)
            
            // 4. Calcula a largura final exata baseada nas colunas decididas
            let totalSpacingBetweenCells = spacing * (numberOfColumns - 1)
            let cellWidth = (availableWidthForCells - totalSpacingBetweenCells) / numberOfColumns
            
            // 5. Calcula a altura necessária para o texto expandido
            let textSpace = UIFontMetrics(forTextStyle: .body).scaledValue(for: 55)
            let cellHeight = cellWidth + textSpace
            
            return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing = UIFontMetrics(forTextStyle: .body).scaledValue(for: 16)
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
}
