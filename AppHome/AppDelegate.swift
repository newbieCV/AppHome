//
//  AppDelegate.swift
//  AppHome
//
//  Created by 张宗宇 on 2023/4/3.
//

import UIKit
import AVFAudio

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 后台播放
        let session: AVAudioSession = AVAudioSession.sharedInstance()
        try? session.setActive(true)
        try? session.setCategory(AVAudioSession.Category.playback)
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - 音乐播放器 监听后台行为
    override func remoteControlReceived(with event: UIEvent?) {
        if event?.type == UIEvent.EventType.remoteControl {
            switch event?.subtype {
            case .remoteControlPlay:
                // 点击了播放按钮
                break
            case .remoteControlTogglePlayPause:
                // 点击了暂停按钮
                break
            case .remoteControlNextTrack:
                // 下一首
                break
            case .remoteControlPreviousTrack:
                // 上一首
                break
            default:
                return
            }
        }
    }
}

