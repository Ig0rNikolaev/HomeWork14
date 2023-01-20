//
//  Model.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 18.01.2023.
//

import Foundation
import UIKit

struct Model: Hashable {
    let title: String
    let iconImage: String?
    let rightIconImage: String?
    let labelNumber: String?
}

class ModelClass {
    static let models = [
        [Model(title: "Недавние", iconImage: "foto3", rightIconImage: nil, labelNumber: "84"),
         Model(title: "Избранное", iconImage: "foto4", rightIconImage: nil, labelNumber: "2"),
         Model(title: "Instagram", iconImage: "foto1", rightIconImage: nil, labelNumber: "95"),
         Model(title: "WhatsApp", iconImage: "foto7", rightIconImage: nil, labelNumber: "84"),
         Model(title: "Друзья", iconImage: "foto5", rightIconImage: nil, labelNumber: "28"),
         Model(title: "Путешествия", iconImage: "foto", rightIconImage: nil, labelNumber: "75")],

        [Model(title: "Тайланд", iconImage: "foto8", rightIconImage: nil, labelNumber: "31"),
         Model(title: "Германия", iconImage: "foto2", rightIconImage: nil, labelNumber: "15"),
         Model(title: "Греция", iconImage: "foto6", rightIconImage: nil, labelNumber: "25")],

        [Model(title: "Видео", iconImage: "video", rightIconImage: nil, labelNumber: "98"),
         Model(title: "Селфи", iconImage: "person.crop.square", rightIconImage: nil, labelNumber: "7"),
         Model(title: "Фото Live Photos", iconImage: "livephoto", rightIconImage: nil, labelNumber: "151"),
         Model(title: "Портреты", iconImage: "cube", rightIconImage: nil, labelNumber: "5"),
         Model(title: "Таймлапс", iconImage: "timelapse", rightIconImage: nil, labelNumber: "2"),
         Model(title: "Замедленно", iconImage: "slowmo", rightIconImage: nil, labelNumber: "2"),
         Model(title: "Снимки экрана", iconImage: "camera.viewfinder", rightIconImage: nil, labelNumber: "8"),
         Model(title: "Записи экрана", iconImage: "record.circle", rightIconImage: nil, labelNumber: "3")],

        [Model(title: "Импортированные", iconImage: "square.and.arrow.up", rightIconImage: "nil", labelNumber: "0"),
         Model(title: "Дубликаты", iconImage: "square.on.square", rightIconImage: nil, labelNumber: "2"),
         Model(title: "Скрытые", iconImage: "eye.slash", rightIconImage: "lock.fill", labelNumber: nil),
         Model(title: "Недавно удаленные", iconImage: "trash", rightIconImage: "lock.fill", labelNumber: nil)]
    ]
}
