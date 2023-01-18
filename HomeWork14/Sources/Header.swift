//
//  Header.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import UIKit

class PhotosCellHeader: UICollectionReusableView {

    static let identifier = "PhotosCellHeader"

    //: MARK: - UI Elements

    lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

 lazy var buttonAll: UIButton = {
        let buttonAll = UIButton(configuration: .plain(), primaryAction: nil)
//        buttonAll.configuration?.title = "Все"
        buttonAll.configuration?.baseForegroundColor = .systemBlue
//        buttonAll.configuration?.attributedTitle?.font = .systemFont(ofSize: 22)
        buttonAll.configuration?.titleAlignment = .trailing
        buttonAll.translatesAutoresizingMaskIntoConstraints = false
        return buttonAll
    }()

    lazy var line: UILabel = {
        let line = UILabel()
        line.backgroundColor = .systemGray3
        line.contentMode = .center
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
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
        addSubview(title)
        addSubview(buttonAll)
        addSubview(line)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            title.centerYAnchor.constraint(equalTo: centerYAnchor.self),
            title.leftAnchor.constraint(equalTo: leftAnchor.self),

            buttonAll.centerYAnchor.constraint(equalTo: centerYAnchor.self),
            buttonAll.rightAnchor.constraint(equalTo: rightAnchor.self),

            line.centerXAnchor.constraint(equalTo: centerXAnchor.self),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 100),
            line.rightAnchor.constraint(equalTo: rightAnchor.self),
            line.topAnchor.constraint(equalTo: topAnchor.self, constant: 5)

        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        buttonAll.configuration?.title = nil
    }
}
