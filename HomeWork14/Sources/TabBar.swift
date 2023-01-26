//
//  TabBar.swift
//  HomeWork14
//
//  Created by Игорь Николаев on 20.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

    //: MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarColor()
        setupTitle()
        setupTabBarViewController()
    }

    //: MARK: - Setups

    func setupTabbarColor() {
        tabBar.backgroundColor = .white
    }
    
        func setupTitle() {
            title = Title.album
            navigationController?.navigationBar.prefersLargeTitles = true
            let leftBarButtom = UIBarButtonItem(systemItem: .add)
            navigationItem.leftBarButtonItem = leftBarButtom
        }

    func setupTabBarViewController() {
        let media = ViewController()
        let mediaIcon = UITabBarItem(title: TabBarTitle.media,
                                     image: UIImage(systemName: TabBarIcon.media),
                                     selectedImage: UIImage(systemName: TabBarIcon.media))
        media.tabBarItem = mediaIcon
        let forYou = ViewController()
        let forYouIcon = UITabBarItem(title: TabBarTitle.forYou,
                                      image: UIImage(systemName: TabBarIcon.forYou),
                                      selectedImage: UIImage(systemName: TabBarIcon.forYou))
        forYou.tabBarItem = forYouIcon

        let albums = ViewController()
        let albumsIcon = UITabBarItem(title: TabBarTitle.albums,
                                      image: UIImage(systemName: TabBarIcon.albums),
                                      selectedImage: UIImage(systemName: TabBarIcon.albums))
        albums.tabBarItem = albumsIcon

        let search = ViewController()
        let searchIcon = UITabBarItem(title: TabBarTitle.search,
                                      image: UIImage(systemName: TabBarIcon.search),
                                      selectedImage: UIImage(systemName: TabBarIcon.search))
        search.tabBarItem = searchIcon
        let controller = [media, forYou, albums, search]
        self.setViewControllers(controller, animated: true)
    }
}
