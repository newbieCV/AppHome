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
        view.backgroundColor = .white
        // 上拉弹窗
        let popView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: 500)
        // 点击toast
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.setTitle("toast提示", for: .normal)
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 200), size: CGSize(width: 150, height: 50))
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        view.addSubview(btn)
    }
    var count = 0
    @objc func clickBtn() {
        AHToast.sharedManager().showText(text: "点击了toast提示按钮\(count)", leftImageUrl: nil, duration: 3)
        count += 1
    }
}
