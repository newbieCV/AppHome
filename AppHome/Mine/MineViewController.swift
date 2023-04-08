//
//  MineViewController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/5.
//

import AHComponents

class MineViewController: AHViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        // 上拉弹窗
        let popView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: 500)
    }
}
