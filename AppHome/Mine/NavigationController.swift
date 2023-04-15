//
//  NavigationController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/15.
//

import Foundation
import UIKit
import AMapFoundationKit
import MAMapKit

// MARK: 高德地图
open class NavigationController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        configMap(apiKey: nil)
        // 根据传入的经纬度数组自动调整地图大小
        addAnnotations(coordinates: [CLLocationCoordinate2D(latitude: 39, longitude: 116)])
        showsAnnotations(edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    var mapView = MAMapView()
    var annotations: [MAPointAnnotation] = []
    var isFirstLoadMap = false
}

extension NavigationController {
    /// 添加地图基本配置
    func configMap(apiKey: String?) {
        AMapServices.shared().apiKey = apiKey ?? "15f252085c1875f2c96429e37a437568"
        // 更新协议，8.1.0版本开始
        MAMapView.updatePrivacyAgree(.didAgree)
        MAMapView.updatePrivacyShow(.didShow, privacyInfo: .didContain)
        // 打开https开关
        AMapServices.shared().enableHTTPS = true
        // 需要重新设置MAMapView，否则地图展示不出来
        mapView = MAMapView(frame: view.frame)
        mapView.delegate = self // 需要前置
        mapView.showsUserLocation = true
        mapView.compassOrigin = CGPoint(x: UIScreen.main.bounds.width - 40, y: 80)
        mapView.zoomLevel = 13
        view.addSubview(mapView)
    }
    
    /// 添加Annotations
    func addAnnotations(coordinates: [CLLocationCoordinate2D]) {
        annotations.removeAll()
        for coordinate in coordinates {
            let anno = MAPointAnnotation()
            anno.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            anno.title = "123"
            anno.subtitle = "456"
            annotations.append(anno)
        }
    }

    /// 展示所有传入annotation
    /// 参考：https://lbs.amap.com/demo/sdk/map-zoomtospan#ios
    func showsAnnotations(edgePadding insets:UIEdgeInsets) {
        var rect:MAMapRect = MAMapRectZero

        for annotation:MAPointAnnotation in annotations {
            let diagonalPoint:CLLocationCoordinate2D = CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude - (annotation.coordinate.latitude - mapView.centerCoordinate.latitude),mapView.centerCoordinate.longitude - (annotation.coordinate.longitude - mapView.centerCoordinate.longitude))

            let annotationMapPoint: MAMapPoint = MAMapPointForCoordinate(annotation.coordinate)
            let diagonalPointMapPoint: MAMapPoint = MAMapPointForCoordinate(diagonalPoint)

            let annotationRect:MAMapRect = MAMapRectMake(min(annotationMapPoint.x, diagonalPointMapPoint.x), min(annotationMapPoint.y, diagonalPointMapPoint.y), abs(annotationMapPoint.x - diagonalPointMapPoint.x), abs(annotationMapPoint.y - diagonalPointMapPoint.y));

            rect = MAMapRectUnion(rect, annotationRect)
        }

        mapView.setVisibleMapRect(rect, edgePadding: insets, animated: true)
    }
}

// MARK: - MAMapViewDelegate
extension NavigationController : MAMapViewDelegate {
    /// 定位纠偏
    public func mapViewRequireLocationAuth(_ locationManager: CLLocationManager!) {
        locationManager.requestAlwaysAuthorization()
    }
    /// 基于定位位置，在定位回调中进行POI搜索和逆地理编码
    public func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        if !updatingLocation || userLocation.location.horizontalAccuracy < 0 {
            return
        }
        if !isFirstLoadMap {
            isFirstLoadMap = true
            mapView.centerCoordinate = userLocation.location.coordinate
        }
    }
}
