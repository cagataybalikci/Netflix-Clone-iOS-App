//
//  ViewController.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 3.05.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        
        //MARK: Initialize the VCs to the TabBar
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        //MARK: TabBar VC Parameters
        
        // Tabbar Icons
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        // Titles
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Searches"
        vc4.title = "Downloads"
        
        //MARK: TabBar Tint
        tabBar.tintColor = .label
        
        
        //MARK: Setting up to the VC to show up
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

