//
//  TrackView.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 14/05/26.
//

import UIKit

class TrackView: UIView {
    
    // Subviews
//MARK: NAVBAR
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
    
    //MARK: IMAGEVIEW
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
    
    //MARK: PROGRESSBAR
    //UIProgressBar
    let progressBar: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: BUTTONS PLAY...
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
        view.setImage(UIImage(systemName: "shuffle", withConfiguration: conf, for: .normal)
            view.tintColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    //UIStackView - botao de voltar musica
    let previousButton: UIButton = {
            let view = UIButton()
            view.setImage(UIImage(systemName: "backward.end.fill"), for: .normal)
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
           view.setImage(UIImage(systemName: "forward.end.fill"), for: .normal)
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
    
    //MARK: aqui contem tres buttons -
    let footerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Stack vertical: ícone bluetooth + label
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

        let image = UIImage(
            named: "bluetooth"
            )
        view.setImage(image, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
      
        return view
    }()
    
    let textBluetooth: UILabel = {
        let label = UILabel()
        label.text = "BEATSPILL+"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        view.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //butto de list
    let listButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: LETRA DA MUSICA
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
    
    //MARK: CONECTANDO MODULOS DA VIEW
    override init(frame: CGRect){
        super.init(frame: frame)
        setupBackground()
        setupHierarchy()
        setupConstraints()
        
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    //so pra definir cor fundo
    private func setupBackground(){
        backgroundColor = .gray
    }
    
    //hierarquia dos módulos
    ///views soltas na root → addSubview()
    /// views dentro de UIStackView → addArrangedSubview()
    private func setupHierarchy(){
        //NavBar
        addSubview(navBarStackView)
        navBarStackView.addArrangedSubview(voltarButton)
        navBarStackView.addArrangedSubview(nomeAlbumLabel)
        navBarStackView.addArrangedSubview(configButton)
        
        //ImageView
        addSubview(capaMusicaView)
        
        //RowStackView
        addSubview(rowStackView)
        rowStackView.addArrangedSubview(infoStackView)
        rowStackView.addArrangedSubview(likeButton)
        
        infoStackView.addArrangedSubview(tituloMusicaLabel)
        infoStackView.addArrangedSubview(nomeCantorLabel)
       
        
        //ProgressBar
        addSubview(progressBar)
        
        //Buttons play
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(shuffleButton)
        buttonStackView.addArrangedSubview(previousButton)
        buttonStackView.addArrangedSubview(playPauseButton)
        buttonStackView.addArrangedSubview(nextButton)
        buttonStackView.addArrangedSubview(repeatButton)
        
        //footer de tres buttons
        addSubview(footerStackView)
        // bluetooth + texto juntos (vertical)
        bluetoothContainerStack.addArrangedSubview(bluetoothButton)
        bluetoothContainerStack.addArrangedSubview(textBluetooth)
        
        // botões da direita
        rightButtonsStack.addArrangedSubview(sharedButton)
        rightButtonsStack.addArrangedSubview(listButton)

        footerStackView.addArrangedSubview(bluetoothContainerStack)
        footerStackView.addArrangedSubview(rightButtonsStack)
        
        
        //Letra da musica
        addSubview(textLetraMusica)
        textLetraMusica.addArrangedSubview(letraLabel)
        
        
    }
//        .topAnchor       → de onde começa pelo topo
//        .leadingAnchor   → margem esquerda
//        .trailingAnchor  → margem direita
//        .heightAnchor    → altura fixa
//        .widthAnchor     → largura fixa
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // NAVBAR
            navBarStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            navBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            navBarStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            navBarStackView.heightAnchor.constraint(equalToConstant: 44),

            // CAPA — proporcional, quadrada
            capaMusicaView.topAnchor.constraint(equalTo: navBarStackView.bottomAnchor, constant: 24),
            capaMusicaView.centerXAnchor.constraint(equalTo: centerXAnchor),
            capaMusicaView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.88),
            capaMusicaView.heightAnchor.constraint(equalTo: capaMusicaView.widthAnchor),

            // ROWSTACKVIEW (info + Like)
            rowStackView.topAnchor.constraint(equalTo: capaMusicaView.bottomAnchor, constant: 24),
            rowStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            rowStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            rowStackView.heightAnchor.constraint(equalToConstant: 50),
            
            // PROGRESS BAR
            progressBar.topAnchor.constraint(equalTo: rowStackView.bottomAnchor, constant: 16),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            // BOTOES PLAY
            buttonStackView.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonStackView.heightAnchor.constraint(equalToConstant: 64),
            
            playPauseButton.widthAnchor.constraint(equalToConstant: 80),
            playPauseButton.heightAnchor.constraint(equalToConstant: 80),

           
            //FooterStackView
            footerStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 24),
            footerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            footerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            footerStackView.heightAnchor.constraint(equalToConstant: 60),
            
            bluetoothButton.heightAnchor.constraint(equalToConstant: 30),
            bluetoothButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            // LETRA
            textLetraMusica.topAnchor.constraint(equalTo: footerStackView.bottomAnchor, constant: 16),
            textLetraMusica.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            textLetraMusica.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            textLetraMusica.heightAnchor.constraint(equalToConstant: 50),
            textLetraMusica.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

}
