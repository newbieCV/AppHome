//
//  HomePageViewController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/5.
//

import Foundation
import UIKit
import AHComponents

class HomePageViewController: RootViewController {
    let contentHeight = kScreen.height - CommonTools().tabBarHeight()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
        setup()
    }
    
    func setup() {
        container.contentSize = CGSize(width: kScreen.width * 4, height: contentHeight)
        for idx in 0..<4 {
            let vc = UIViewController()
            vc.view.frame = CGRect(x: kScreen.width * CGFloat(idx), y: 0, width: kScreen.width, height: contentHeight)
            if idx == 0 {
                vc.view.backgroundColor = .cyan
            } else if idx == 1 {
                vc.view.backgroundColor = .orange
            } else if idx == 2 {
                vc.view.backgroundColor = .blue
            } else {
                vc.view.backgroundColor = .yellow
            }
            container.addSubview(vc.view)
        }
    }
    
    private var container: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreen.width, height: kScreen.height))
        view.backgroundColor = UIColor(named: "bgColor")
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
}
