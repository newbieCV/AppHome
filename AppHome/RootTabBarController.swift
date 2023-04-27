//
//  RootTabBarController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/5.
//

import AHComponents

class RootTabBarController: AHTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        creatSubViewControllers()
    }
    
    func creatSubViewControllers() {
        let homeVC = HomePageViewController()
        let homeImage = AHImageTools.tailorImage(image: UIImage(named: "home.png"), newSize: CGSize(width: 30, height: 30))
        homeVC.tabBarItem = UITabBarItem(title: "首页", image: homeImage, selectedImage: homeImage)
        
        let avVC = AudioPlayerController()
        let avImage = AHImageTools.tailorImage(image: UIImage(named: "mp3.png"), newSize: CGSize(width: 30, height: 30))
        avVC.tabBarItem = UITabBarItem(title: "音乐", image: avImage, selectedImage: avImage)
        
        let mapVC = MapViewController()
        let mapImage = AHImageTools.tailorImage(image: UIImage(named: "map.png"), newSize: CGSize(width: 30, height: 30))
        mapVC.tabBarItem = UITabBarItem(title: "导航", image: mapImage, selectedImage: mapImage)
        
        let mineVC = MineViewController()
        let mineImage = AHImageTools.tailorImage(image: UIImage(named: "mine.png"), newSize: CGSize(width: 30, height: 30))
        mineVC.tabBarItem = UITabBarItem(title: "我的", image: mineImage, selectedImage: mineImage)
        
        let tabArray = [homeVC, avVC, mapVC, mineVC]
        viewControllers = tabArray
    }
}
