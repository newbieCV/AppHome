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
        view.addSubview(playBtn)
        configMusic()
    }
    
    private lazy var avatar: UIImageView = {
        let view = UIImageView(frame: CGRect(origin: CGPoint(x: (kScreen.width - 200) / 2, y: 200),
                                             size: CGSize(width: 200, height: 200)))
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var playBtn: UIButton = {
        let btn = UIButton(frame: CGRect(origin: CGPoint(x: (kScreen.width - 60) / 2, y: kScreen.height - 300),
                                         size: CGSize(width: 60, height: 60)))
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.addTarget(self, action: #selector(clickPlayBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var player: AHAudioPlayer = {
        let audio = AHAudioPlayer()
        audio.playEndCallBack = {[weak self] _ in
            self?.stopPlay()
        }
        return audio
    }()
}

extension AudioPlayerController {
    func configMusic() {
        player.configAudio(urlStr: "")
    }
    
    @objc
    func clickPlayBtn() {
        if !player.playStatus() {
            // 当前没有播放，点击的是播放，显示的应该是暂停，播放声音
            playBtn.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        } else {
            playBtn.setImage(UIImage(named: "play"), for: .normal)
            player.pause()
        }
    }
    
    func stopPlay() {
        playBtn.setImage(UIImage(named: "play"), for: .normal)
        player.stop()
    }
}
