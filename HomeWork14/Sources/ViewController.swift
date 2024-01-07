//
//  ViewController.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ModelClass()
    
    //: MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCompositionalLayout())
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: AlbumsCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(PhotosCellHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PhotosCellHeader.identifier)
        return collectionView
    }()
    
    //: MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    //: MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    func createHeaderAlbum() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = Header.layoutSectionHeaderSize
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading)
        layoutSectionHeader.contentInsets = Header.headerContentInsets
        return layoutSectionHeader
    }
    
    func createAlbumSection(_ countGroup: Int,
                            _ groupSizeHeight: CGFloat,
                            _ groupContentInsetsBottom: CGFloat,
                            _ sectionContentInsetsBottom: CGFloat) -> NSCollectionLayoutSection {
        let itemSize = AlbumCell.itemSize
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = AlbumCell.itemContentInsets
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.15),
                                               heightDimension: .fractionalWidth(groupSizeHeight))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                           subitem: layoutItem,
                                                           count: countGroup)
        layoutGroup.interItemSpacing = AlbumCell.groupInterItemSpacing
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1.5, bottom: groupContentInsetsBottom, trailing: 1.5)
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: sectionContentInsetsBottom, trailing: 6)
        layoutSection.boundarySupplementaryItems = [createHeaderAlbum()]
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        return layoutSection
    }
    
    func setupListLayout(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: .init(appearance: .sidebarPlain), layoutEnvironment: layoutEnvironment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.1),
                                                heightDimension: .estimated(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .topLeading)
        header.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                       leading: 6,
                                                       bottom: 10,
                                                       trailing: 6)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
    
    func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, layoutEnvironment ) -> NSCollectionLayoutSection in
            
            switch SectionName(rawValue: section) {
            case .myAlbums:
                return self.createAlbumSection(2, 4 / 3.31, 20, 0)
            case .sharedAlbums:
                return self.createAlbumSection(1, 1 / 1.8, 0, 10)
            case .mediaTypes, .utilities:
                return self.setupListLayout(layoutEnvironment: layoutEnvironment)
            default:
                return self.setupListLayout(layoutEnvironment: layoutEnvironment)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.optionsModel[section].options.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.optionsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath)
    -> UICollectionReusableView {
        
        switch SectionName(rawValue: indexPath.section) {
        case .myAlbums:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PhotosCellHeader.identifier,
                                                                               for: indexPath) as? PhotosCellHeader else { return UICollectionReusableView() }
            header.title.text = Header.myAlbum
            header.buttonAll.configuration?.title = Header.allButton
            header.buttonAll.configuration?.attributedTitle?.font = .systemFont(ofSize: 22)
            return header
        case .sharedAlbums:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PhotosCellHeader.identifier,
                                                                               for: indexPath) as? PhotosCellHeader else { return UICollectionReusableView() }
            header.title.text = Header.sharedAlbums
            header.buttonAll.configuration?.title = Header.allButton
            header.buttonAll.configuration?.attributedTitle?.font = .systemFont(ofSize: 22)
            return header
        case .mediaTypes:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PhotosCellHeader.identifier,
                                                                               for: indexPath) as? PhotosCellHeader else { return UICollectionReusableView() }
            header.title.text = Header.mediaTypes
            return header
        case .utilities:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PhotosCellHeader.identifier,
                                                                               for: indexPath) as? PhotosCellHeader else { return UICollectionReusableView() }
            header.title.text = Header.utilities
            header.line.backgroundColor = .white
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PhotosCellHeader.identifier,
                                                                               for: indexPath) as? PhotosCellHeader else { return UICollectionReusableView() }
            header.title.text = Header.utilities
            header.line.backgroundColor = .white
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = model.optionsModel[indexPath.section].options[indexPath.item]
        
        switch model {
        case .albumCell(let cellModel):
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCell.identifier,
                                                                for: indexPath) as? AlbumsCell else { return UICollectionViewCell() }
            item.configuration(model: cellModel)
            return item
        case .tableCell(cellModel: let cellModel):
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier,
                                                                for: indexPath) as? TableCell else { return UICollectionViewCell() }
            item.configuration(model: cellModel)
            return item
        default:
            break
        }
    }
}
