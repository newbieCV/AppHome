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
        
        
        let dot = UIView()
        dot.backgroundColor = .red
        dot.frame = CGRect(x: 10, y: 10, width: 4, height: 4)
        dot.layer.cornerRadius = 2
        view.addSubview(dot)
        
        UIView.animate(withDuration: 3) {
            dot.frame = CGRect(x: kScreen.width - 10, y: kScreen.height - 100, width: 4, height: 4)
        } completion: { _ in
            dot.removeFromSuperview()
        }
    }
}
