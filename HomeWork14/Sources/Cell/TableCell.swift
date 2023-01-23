//
//  TableCell.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 19.01.2023.
//

import Foundation
import UIKit

class TableCell: UICollectionViewCell {

    static let identifier = "TableCell"

    //: MARK: - UI Elements

    lazy var lineTable: UILabel = {
        let lineTable = UILabel()
        lineTable.contentMode = .center
        lineTable.translatesAutoresizingMaskIntoConstraints = false
        return lineTable
    }()

    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.tintColor = .systemBlue
        iconImage.contentMode = .scaleAspectFill
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()

    private lazy var labelTable: UILabel = {
        let labelTable = UILabel()
        labelTable.textColor = .systemBlue
        labelTable.contentMode = .center
        labelTable.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        labelTable.translatesAutoresizingMaskIntoConstraints = false
        return labelTable
    }()

    private lazy var rightIconImage: UIImageView = {
        let rightIconImage = UIImageView()
        rightIconImage.tintColor = .systemGray
        rightIconImage.contentMode = .center
        rightIconImage.translatesAutoresizingMaskIntoConstraints = false
        return rightIconImage
    }()

    private lazy var labelNumber: UILabel = {
        let labelNumber = UILabel()
        labelNumber.textColor = .systemGray
        labelNumber.contentMode = .center
        labelNumber.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        labelNumber.translatesAutoresizingMaskIntoConstraints = false
        return labelNumber
    }()

    private lazy var chevronIcon: UIImageView = {
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.forward")
        chevron.tintColor = .systemGray3
        chevron.contentMode = .center
        chevron.translatesAutoresizingMaskIntoConstraints = false
        return chevron
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
        contentView.addSubview(lineTable)
        contentView.addSubview(labelTable)
        contentView.addSubview(iconImage)
        contentView.addSubview(labelNumber)
        contentView.addSubview(rightIconImage)
        contentView.addSubview(chevronIcon)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            iconImage.heightAnchor.constraint(equalToConstant: 25),
            iconImage.widthAnchor.constraint(equalToConstant: 25),

            labelTable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelTable.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 20),

            labelNumber.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelNumber.rightAnchor.constraint(equalTo: chevronIcon.rightAnchor, constant: -22),

            rightIconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightIconImage.rightAnchor.constraint(equalTo: chevronIcon.rightAnchor, constant: -17),

            chevronIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            chevronIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),

            lineTable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            lineTable.heightAnchor.constraint(equalToConstant: 1),
            lineTable.widthAnchor.constraint(equalToConstant: 500),
            lineTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    // MARK: - Configuration

    func configuration(model: Model) {
        self.iconImage.image = UIImage(systemName: model.iconImage ?? "")
        labelTable.text = model.title
        labelNumber.text = model.labelNumber
        self.rightIconImage.image = UIImage(systemName: model.rightIconImage ?? "")
        deleteLine()
    }

    func deleteLine() {
        if labelTable.text == "Недавно удаленные" || labelTable.text == "Записи экрана" {
            lineTable.backgroundColor = .white
        } else {
            lineTable.backgroundColor = .systemGray5
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        labelNumber.text = nil
        labelTable.text = nil
        self.iconImage.image = nil
        self.rightIconImage.image = nil
    }
}
