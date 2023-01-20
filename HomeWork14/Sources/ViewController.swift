//
//  ViewController.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //: MARK: - UI Elements

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
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
        setupTitle()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    //: MARK: - Setups

    func setupView() {
        view.backgroundColor = .white
    }

    func setupTitle() {
        title = Title.album
        navigationController?.navigationBar.prefersLargeTitles = true
        let leftBarButtom = UIBarButtonItem(systemItem: .add)
        navigationItem.leftBarButtonItem = leftBarButtom
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in

            switch section {
            case 0:
                let itemSize = SectionZero.itemSize
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = SectionZero.itemContentInsets
                let groupSize = SectionZero.groupSize
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                layoutGroup.interItemSpacing = SectionZero.groupInterItemSpacing
                layoutGroup.contentInsets = SectionZero.groupContentInsets
                let layoutSectionHeaderSize = SectionZero.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = SectionZero.headerContentInsets
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = SectionZero.sectionContentInsets
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                return layoutSection

            case 1:
                let itemSize = SectionOne.itemSize
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = SectionOne.itemContentInsets
                let groupSize = SectionOne.groupSize
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitem: layoutItem,
                                                                     count: 1)
                layoutGroup.interItemSpacing = SectionOne.groupInterItemSpacing
                layoutGroup.contentInsets = SectionOne.groupContentInsets
                let layoutSectionHeaderSize = SectionOne.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = SectionOne.headerContentInsets
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = SectionOne.sectionContentInsets
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                return layoutSection

            default:
                let itemSize = SectionDefoult.itemSize
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = SectionDefoult.itemContentInsets
                let groupSize = SectionDefoult.groupSize
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                let layoutSectionHeaderSize = SectionDefoult.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = SectionDefoult.headerContentInsets
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = SectionDefoult.sectionContentInsets
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ModelClass.models[section].count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ModelClass.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0, 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCell.identifier, for: indexPath) as! AlbumsCell
            item.configuration(model: ModelClass.models[indexPath.section][indexPath.item])

            return item
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as! TableCell
            item.configuration(model: ModelClass.models[indexPath.section][indexPath.item])
            return item
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath)
    -> UICollectionReusableView {
        

        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: PhotosCellHeader.identifier,
                                                                         for: indexPath) as! PhotosCellHeader
            header.title.text = Header.myAlbum
            header.buttonAll.configuration?.title = Header.allButton
            header.buttonAll.configuration?.attributedTitle?.font = .systemFont(ofSize: 22)
            return header

        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: PhotosCellHeader.identifier,
                                                                         for: indexPath) as! PhotosCellHeader
            header.title.text = Header.sharedAlbums
            header.buttonAll.configuration?.title = Header.allButton
            header.buttonAll.configuration?.attributedTitle?.font = .systemFont(ofSize: 22)
            return header

        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: PhotosCellHeader.identifier,
                                                                         for: indexPath) as! PhotosCellHeader
            header.title.text = Header.mediaTypes
            return header

        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: PhotosCellHeader.identifier,
                                                                         for: indexPath) as! PhotosCellHeader
            header.title.text = Header.utilities
            return header
        }
    }
}
