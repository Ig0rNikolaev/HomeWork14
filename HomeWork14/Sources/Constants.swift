//
//  Constants.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 20.01.2023.
//

import UIKit

//MARK: - Constants Model

enum ConstantsTitle{
   static let recents = "Недавние"
    static let favourites = "Избранное"
    static let instagram = "Instagram"
    static let whatsApp = "WhatsApp"
    static let friends = "Друзья"
    static let travels = "Путешествия"
    static let thailand = "Тайланд"
    static let germany = "Германия"
    static let greece = "Греция"
    static let videos = "Видео"
    static let selfies = "Селфи"
    static let livePhotos = "Фото Live Photos"
    static let portrait = "Портреты"
    static let timeLapse = "Таймлапс"
    static let sloMo = "Замедленно"
    static let screenshots = "Снимки экрана"
    static let screenRecording = "Записи экрана"
    static let imports = "Импортированные"
    static let duplicate = "Дубликаты"
    static let hidden = "Скрытые"
    static let recentlyDeleted = "Недавно удаленные"
}

enum ConstantsImage {
    static let recents = "foto3"
    static let favourites = "foto4"
    static let instagram = "foto1"
    static let friends = "foto5"
    static let travels = "foto"
    static let thailand = "foto8"
    static let germany = "foto2"
    static let greece = "foto6"
    static let videos = "video"
    static let selfies = "person.crop.square"
    static let livePhotos = "livephoto"
    static let portrait = "cube"
    static let timeLapse = "timelapse"
    static let sloMo = "slowmo"
    static let screenshots = "camera.viewfinder"
    static let screenRecording = "record.circle"
    static let imports = "square.and.arrow.up"
    static let duplicate = "square.on.square"
    static let hidden = "eye.slash"
    static let recentlyDeleted = "trash"
    static let rightImage = "lock.fill"
}

enum ConstantsNumber {
    static let recents = "84"
    static let favourites = "2"
    static let instagram = "95"
    static let whatsApp = "84"
    static let friends = "28"
    static let travels = "75"
    static let thailand = "31"
    static let germany = "15"
    static let greece = "25"
    static let videos = "98"
    static let selfies = "7"
    static let livePhotos = "151"
    static let portrait = "5"
    static let timeLapse = "2"
    static let sloMo = "2"
    static let screenshots = "8"
    static let screenRecording = "3"
    static let imports = "0"
    static let duplicate = "2"
}

//MARK: - ViewController

//Setup

enum SectionZero {
    static let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))

    static let itemContentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
    static let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.15),
                                                  heightDimension: .fractionalWidth(4 / 3.31))

    static let groupInterItemSpacing = NSCollectionLayoutSpacing.fixed(20)
    static let groupContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1.5, bottom: 20, trailing: 1.5)
    static let layoutSectionHeaderSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.1),
        heightDimension: .estimated(60))

    static let headerContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 11)


    static let sectionContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
}

enum SectionOne {
    static let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))

    static let itemContentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

    static let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.15),
                                                   heightDimension: .fractionalWidth(1 / 1.8))

    static let groupInterItemSpacing = NSCollectionLayoutSpacing.fixed(20)
    static let groupContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1.5, bottom: 0, trailing: 1.5)

    static  let layoutSectionHeaderSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.1),
        heightDimension: .estimated(60))

    static let headerContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 11)


    static let sectionContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 10, trailing: 6)
}

enum SectionDefoult {
    static let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .fractionalHeight(1))

    static let itemContentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
    static let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .absolute(54))

    static let layoutSectionHeaderSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.1),
        heightDimension: .estimated(60))

    static let headerContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 11)

    static let sectionContentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: -2)
}

// String

enum Header {
    static let myAlbum = "Мои альбомы"
    static let sharedAlbums = "Общие альбомы"
    static let mediaTypes = "Типы медиафайлов"
    static let utilities = "Другое"
    static let allButton = "Вce"
}

enum Title {
    static let album = "Альбомы"
}


