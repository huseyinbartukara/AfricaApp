//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Bartu Kara on 26.09.2023.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName : String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
