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
        
        view.addSubview(scrollView)
        scrollView.addSubview(avatar)
        scrollView.addSubview(playConfigView)
        configMusic()
        scrollView.addSubview(lyricView)
        
        /// 上拉播放列表
        tableView = loadBottomPopView(contentNormalHeight: 100, contentDetailHeight: kScreen.height - 200)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    private var tableView: AHTableView?
    
    private var scrollView: AHScrollerView = {
        let view = AHScrollerView(frame: CGRect(origin: .zero, size: CGSize(width: kScreen.width, height: kScreen.height)))
        view.contentSize = CGSize(width: kScreen.width * 2, height: kScreen.height)
        return view
    }()
    
    /// 播放页
    private lazy var playerView: AudioPlayerView = {
        let view = AudioPlayerView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                        size: CGSize(width: kScreen.width, height: kScreen.height)))
        return view
    }()
    
    /// 歌词页
    private lazy var lyricView: AudioPlayerLyricsView = {
        let view = AudioPlayerLyricsView(frame: CGRect(origin: CGPoint(x: kScreen.width, y: 0),
                                        size: CGSize(width: kScreen.width, height: kScreen.height)))
        return view
    }()
    
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
    
    /// 播放器
    private lazy var player: AHAudioPlayer = {
        let audio = AHAudioPlayer()
        audio.playEndCallBack = { [weak self] _ in
            self?.stopPlay()
            self?.playConfigView.changePlayBtn(status: false)
        }
        audio.playTimeCallBack = { [weak self] curTime, duration in
            self?.playConfigView.updateSlideProgress(curTime: curTime, duration: duration)
        }
        return audio
    }()
}

// MARK: - 控制音乐播放
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

// MARK: - tableView
extension AudioPlayerController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: kScreen.width, height: 40)))
        cell.contentView.backgroundColor = indexPath.row % 2 > 0 ? .yellow : .blue
        return cell
    }
}
