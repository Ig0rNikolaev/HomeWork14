//
//  MyAlbumsCell.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import UIKit

class AlbumsCell: UICollectionViewCell {

    static let identifier = "AlbumsCell"
    
    //: MARK: - UI Elements

    private let imagePhoto: UIImageView = {
        let imagePhoto = UIImageView()
        imagePhoto.layer.cornerRadius = 5
        imagePhoto.clipsToBounds = true
        imagePhoto.contentMode = .scaleToFill
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        return imagePhoto
    }()

    lazy var lablePhoto: UILabel = {
        let lablePhoto = UILabel()
        lablePhoto.textColor = .black
        lablePhoto.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lablePhoto.translatesAutoresizingMaskIntoConstraints = false
        return lablePhoto
    }()

    lazy var lablePhotoNamber: UILabel = {
        let lablePhotoNamber = UILabel()
        lablePhotoNamber.textColor = .systemGray
        lablePhotoNamber.font = UIFont.systemFont(ofSize: 15.5, weight: .regular)
        lablePhotoNamber.translatesAutoresizingMaskIntoConstraints = false
        return lablePhotoNamber
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(imagePhoto)
        contentView.addSubview(lablePhoto)
        contentView.addSubview(lablePhotoNamber)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imagePhoto.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -40),
            imagePhoto.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0),
            imagePhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            lablePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            lablePhotoNamber.topAnchor.constraint(equalTo: lablePhoto.bottomAnchor, constant: 3),
            lablePhotoNamber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
    // MARK: - Configuration

    func configuration(model: Model) {
        self.imagePhoto.image = UIImage(named: model.iconImage ?? "")
        lablePhoto.text = model.title
        lablePhotoNamber.text = model.labelNumber
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.imagePhoto.image = nil
        lablePhoto.text = nil
        lablePhotoNamber.text = nil
    }
}
