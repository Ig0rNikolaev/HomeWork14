//
//  TabBar.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 20.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTabBarViewController()
    }

        func setupTitle() {
            title = Title.album
            navigationController?.navigationBar.prefersLargeTitles = true
            let leftBarButtom = UIBarButtonItem(systemItem: .add)
            navigationItem.leftBarButtonItem = leftBarButtom
        }

    func setupTabBarViewController() {
        let media = ViewController()
        let mediaIcon = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        media.tabBarItem = mediaIcon

        let forYou = ViewController()
        let forYouIcon = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYou.tabBarItem = forYouIcon

        let albums = ViewController()
        let albumsIcon = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        albums.tabBarItem = albumsIcon

        let search = ViewController()
        let searchIcon = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        search.tabBarItem = searchIcon

        let controller = [media, forYou, albums, search]
        self.setViewControllers(controller, animated: true)
    }
}
