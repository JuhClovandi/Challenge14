//
//  SearchViewController.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 13/05/26.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, ViewCodeProtocol {
    
    private let searchBar = SearchBarView()
    private let playerView = MusicPlayerCardView()
    private let headerView = HeaderSearchView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // registrar uma celula para saber o que desenhar
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.reuseIdentifier
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    func buildHierarchy() {
        view.addSubview(headerView)
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        view.addSubview(playerView)
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerView.heightAnchor.constraint(equalToConstant: 44),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            // search bar colada no topo e laterais(safe area)
            searchBar.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // collectionView colada embaixo da search bar
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            playerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            playerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
        
    func applyAdditionalChanges() {
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self // avisar para a collectionview que a searchviewcontroller é a fonte de dado
        
        let isIpad = traitCollection.horizontalSizeClass == .regular
        playerView.isHidden = isIpad
        
        updateScrollInsets(isIpad: isIpad)
        
        headerView.onCameraTapped = { [weak self] in
            self?.cameraButtonTapped()
        }
        
    }
    
    private func updateScrollInsets(isIpad: Bool) {
        // O player tem 60 de altura + 8 de margem inferior + 8 de respiro = 76
        let bottomInset: CGFloat = isIpad ? 16 : 76
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        collectionView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
    }

    @objc private func cameraButtonTapped() {
        print("Câmera clicada!")
    }
    
    // Método para centralizar as chamadas
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass {
            let isIpad = traitCollection.horizontalSizeClass == .regular
            playerView.isHidden = isIpad
            updateScrollInsets(isIpad: isIpad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension SearchViewController {
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnv) -> NSCollectionLayoutSection? in
            let isIpad = layoutEnv.traitCollection.horizontalSizeClass == .regular
            let columns = isIpad ? 4 : 2
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(columns)),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

            let groupHeight = isIpad ? NSCollectionLayoutDimension.fractionalWidth(0.15) : .fractionalWidth(0.32)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: columns)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(44)
                    )
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [header]
            
            return section
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    // Quantos itens a lista terá
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockSections[section].items.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mockSections.count
    }
    
    // Como é cada célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCell", for: indexPath
        ) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let category = mockSections[indexPath.section].items[indexPath.item]
        cell.setup(title: category.title, color: category.color, image: category.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                  ofKind: kind,
                  withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                  for: indexPath
              ) as? SectionHeaderView else {
            return UICollectionReusableView()
        }
        header.configure(with: mockSections[indexPath.section].title)
        return header
    }
}
