//
//  CommonTools.swift
//  AppHome
//
//  Created by 张宗宇 on 2023/4/5.
//

import Foundation
import UIKit

struct kScreen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

class CommonTools {
    func tabBarHeight() -> CGFloat {
        return UIWindow().rootViewController?.tabBarController?.tabBar.frame.size.height ?? 0
    }
}
