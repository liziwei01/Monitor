//
//  VideoSecure.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI
import AVKit

@ViewBuilder
func VideoSecure(url: URL) -> some View {
    let headers = ["Code": GetHashedString(conf.PrivateKey, Date().truncatedToHalfMinuteUnix())]
    let asset = AVURLAsset(url: url, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
    let item = AVPlayerItem(asset: asset)
    let player = AVPlayer(playerItem: item)
    VideoPlayer(player: player)
}

