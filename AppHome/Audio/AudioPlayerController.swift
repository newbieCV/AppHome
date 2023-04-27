//
//  AudioPlayerController.swift
//  AppHome
//
//  Created by ByteDance on 2023/4/25.
//

import Foundation
import AHComponents

class AudioPlayerController: AHViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(avatar)
        view.addSubview(playConfigView)
        configMusic()
        
        /// 上拉弹窗，使用时需要之后或单独将其置为顶层
        let popView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: kScreen.height - 200)
        popView.addSubview(tableView)
    }
    
    private lazy var avatar: UIImageView = {
        let view = UIImageView(frame: CGRect(origin: CGPoint(x: (kScreen.width - 200) / 2, y: 200),
                                             size: CGSize(width: 200, height: 200)))
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var playConfigView: AHPlayToolsView = {
        let view = AHPlayToolsView()
        view.frame = CGRect(origin: CGPoint(x: 0, y: kScreen.height - 300),
                            size: CGSize(width: kScreen.width, height: 80))
        view.clickPlay = {[weak self] flag in
            self?.clickPlayBtn(flag)
        }
        view.clickLast = {[weak self] in
            self?.clickLast()
        }
        view.clickNext = {[weak self] in
            self?.clickNext()
        }
        return view
    }()
    
    private lazy var player: AHAudioPlayer = {
        let audio = AHAudioPlayer()
        audio.playEndCallBack = {[weak self] _ in
            self?.stopPlay()
        }
        return audio
    }()
    
    private lazy var tableView: AHTableView = {
        let view = AHTableView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                             size: CGSize(width: kScreen.width, height: kScreen.height - 200)))
        return view
    }()
}

extension AudioPlayerController {
    func configMusic() {
        player.configAudio(urlStr: "")
    }
    
    @objc
    func clickPlayBtn(_ flag: Bool) {
        if flag {
            player.play()
        } else {
            player.pause()
        }
    }
    
    func stopPlay() {
        player.stop()
    }
    
    func clickLast() {
        player.stop()
        configMusic()
        player.play()
    }
    
    func clickNext() {
        player.stop()
        configMusic()
        player.play()
    }
}
