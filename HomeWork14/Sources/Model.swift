//
//  Model.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import Foundation
import UIKit

struct Model {
    let title: String
    let iconImage: String?
    let rightIconImage: String?
    let labelNumber: String?
}

enum SectionName: Int {
    case myAlbums
    case sharedAlbums
    case mediaTypes
    case utilities
}

enum CellName {
    case albumCell(cellModel: Model)
    case tableCell(cellModel: Model)
}

struct Sections {
    let nameSection: SectionName
    var options: [CellName]
}

class ModelClass {
    var optionsModel: [Sections] = [
        Sections(nameSection: .myAlbums, options: [
            .albumCell(cellModel: Model(title: "Недавние", iconImage: "foto3", rightIconImage: nil, labelNumber: "84")),
            .albumCell(cellModel: Model(title: "Избранное", iconImage: "foto4", rightIconImage: nil, labelNumber: "2")),
            .albumCell(cellModel: Model(title: "Instagram", iconImage: "foto1", rightIconImage: nil, labelNumber: "95")),
            .albumCell(cellModel: Model(title: "WhatsApp", iconImage: "foto7", rightIconImage: nil, labelNumber: "84")),
            .albumCell(cellModel: Model(title: "Друзья", iconImage: "foto5", rightIconImage: nil, labelNumber: "28")),
            .albumCell(cellModel: Model(title: "Путешествия", iconImage: "foto", rightIconImage: nil, labelNumber: "75"))
        ]),
        
        Sections(nameSection: .sharedAlbums, options: [
            .albumCell(cellModel: Model(title: "Тайланд", iconImage: "foto8", rightIconImage: nil, labelNumber: "31")),
            .albumCell(cellModel: Model(title: "Германия", iconImage: "foto2", rightIconImage: nil, labelNumber: "15")),
            .albumCell(cellModel: Model(title: "Греция", iconImage: "foto6", rightIconImage: nil, labelNumber: "25"))
        ]),
        
        Sections(nameSection: .mediaTypes, options: [
            .tableCell(cellModel: Model(title: "Видео", iconImage: "video", rightIconImage: nil, labelNumber: "98")),
            .tableCell(cellModel: Model(title: "Селфи", iconImage: "person.crop.square", rightIconImage: nil, labelNumber: "7")),
            .tableCell(cellModel: Model(title: "Фото Live Photos", iconImage: "livephoto", rightIconImage: nil, labelNumber: "151")),
            .tableCell(cellModel: Model(title: "Портреты", iconImage: "cube", rightIconImage: nil, labelNumber: "5")),
            .tableCell(cellModel: Model(title: "Таймлапс", iconImage: "timelapse", rightIconImage: nil, labelNumber: "2")),
            .tableCell(cellModel: Model(title: "Замедленно", iconImage: "slowmo", rightIconImage: nil, labelNumber: "2")),
            .tableCell(cellModel: Model(title: "Снимки экрана", iconImage: "camera.viewfinder", rightIconImage: nil, labelNumber: "8")),
            .tableCell(cellModel: Model(title: "Записи экрана", iconImage: "record.circle", rightIconImage: nil, labelNumber: "3"))
        ]),
        
        Sections(nameSection: .utilities, options: [
            .tableCell(cellModel: Model(title: "Импортированные", iconImage: "square.and.arrow.up", rightIconImage: "nil", labelNumber: "0")),
            .tableCell(cellModel: Model(title: "Дубликаты", iconImage: "square.on.square", rightIconImage: nil, labelNumber: "2")),
            .tableCell(cellModel: Model(title: "Скрытые", iconImage: "eye.slash", rightIconImage: "lock.fill", labelNumber: nil)),
            .tableCell(cellModel: Model(title: "Недавно удаленные", iconImage: "trash", rightIconImage: "lock.fill", labelNumber: nil))
        ])
    ]
}
