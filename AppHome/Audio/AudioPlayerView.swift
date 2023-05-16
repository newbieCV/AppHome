//
//  AudioPlayerView.swift
//  AppHome
//
//  Created by ByteDance on 2023/5/6.
//

import AHComponents
import UIKit

class AudioPlayerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 专辑大图
    private lazy var avatar: UIImageView = {
        let view = UIImageView(frame: CGRect(origin: CGPoint(x: (kScreen.width - 200) / 2, y: 200),
                                             size: CGSize(width: 200, height: 200)))
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    /// 播放控制按钮 & 进度条
    private lazy var playConfigView: AHPlayToolsView = {
        let view = AHPlayToolsView()
        view.frame = CGRect(origin: CGPoint(x: 0, y: kScreen.height - 300),
                            size: CGSize(width: kScreen.width, height: 80))
        view.clickPlay = {[weak self] flag in
//            self?.clickPlayBtn(flag)
        }
        view.clickLast = {[weak self] in
//            self?.clickLast()
        }
        view.clickNext = {[weak self] in
//            self?.clickNext()
        }
        return view
    }()
    
}
