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
        
        let mineVC = MineViewController()
        let mineImage = AHImageTools.tailorImage(image: UIImage(named: "mine.png"), newSize: CGSize(width: 30, height: 30))
        mineVC.tabBarItem = UITabBarItem(title: "我的", image: mineImage, selectedImage: mineImage)
        
        let tabArray = [homeVC, mineVC]
        viewControllers = tabArray
    }
}
