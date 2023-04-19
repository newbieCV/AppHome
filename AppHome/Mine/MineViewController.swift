//
//  MineViewController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/5.
//

import AHComponents
import MapKit

class MineViewController: AHViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 高德地图导航 NavigationController
        /// 系统自带地图 AHMapViewController，能有效减少包体积~15.5MB
        let nav = AHMapViewController()
        let chuzuwu = CLLocationCoordinate2D(latitude: 39.971307904587036, longitude: 116.37090252358125)
        let gongsi = CLLocationCoordinate2D(latitude: 39.97957484547363, longitude: 116.3689058384293)
        nav.setMapData(coordinates: [chuzuwu, gongsi], descArrs: ["出租屋", "公司"])
        self.addChild(nav)
        view.addSubview(nav.view)
        
        /// 上拉弹窗
        let popView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: kScreen.height - 200)
        popView.backgroundColor = .cyan
    }
}
