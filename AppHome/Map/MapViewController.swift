//
//  MapViewController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/27.
//

import AHComponents
import MapKit

class MapViewController: AHMapViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 高德地图导航 NavigationController
        /// 系统自带地图 AHMapViewController，能有效减少包体积~15.5MB
        let chuzuwu = CLLocationCoordinate2D(latitude: 39.971307904587036, longitude: 116.37090252358125)
        let gongsi = CLLocationCoordinate2D(latitude: 39.97957484547363, longitude: 116.3689058384293)
        setMapData(coordinates: [chuzuwu, gongsi], descArrs: ["出租屋", "公司"])
    }
}
