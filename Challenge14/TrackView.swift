//
//  TrackView.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 14/05/26.
//

import UIKit

class TrackView: UIView {
    
    // Subviews

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
    
    
    //UIImageView do Album
    let capaMusicaView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false// é obrigatório, sem ele o Auto Layout não funciona.
        return view
    }()
    
    
    //UIStackView - InfoStackView
    let infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UILabel titulo musica
    let tituloMusicaLabel: UILabel = {
        let view = UILabel()
        view.text = "From Me to You"
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UILabel nome Cantor
    let nomeCantorLabel: UILabel = {
        let view = UILabel()
        view.text = "The Beatles"
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //InfoStackView - button de like
    let likeButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "heart"), for: .normal)
            view.tintColor = .systemGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    //UIProgressBar
    let progressBar: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
            view.setImage(UIImage(systemName: "shuffle"), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - botao de voltar musica
    let previousButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "backward.fill"), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - botao de play musica
    let playPauseButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - avançar musica
    let nextButton: UIButton = {
           let view = UIButton()
           view.setImage(UIImage(systemName: "forward.fill"), for: .normal)
           view.tintColor = .white
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    //UIStackView - repetir musica
    let repeatButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "repeat"), for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //aqui contem tres buttons -
    
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
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupBackground()
        setupHierarchy()
        
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    //so pra definir cor fundo
    private func setupBackground(){
        backgroundColor = .red
    }
    
    //hierarquia dos modulos
    ///views soltas na root → addSubview()
    /// views dentro de UIStackView → addArrangedSubview()
    private func setupHierarchy(){
        //NavBar
        addSubview(navBarStackView)
        navBarStackView.addArrangedSubview(voltarButton)
        navBarStackView.addArrangedSubview(nomeAlbumLabel)
        navBarStackView.addArrangedSubview(configButton)
        
        //ImageView
        
        
    }

}
