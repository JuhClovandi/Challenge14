//
//  ArtistCollectionViewCell.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        artistImageView.contentMode = .scaleAspectFill
    }
}

class CircularImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // O próprio sistema operacional cuida do ciclo de renderização perfeitamente sincronizado
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
