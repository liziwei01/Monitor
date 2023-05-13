//
//  DetailView.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: Item
    
    var body: some View {
        VStack(spacing: 60) {
            if item.url.isImage() {
                ImageSecure(url: item.url)
            } else if item.url.isVideo() {
                VideoSecure(url: item.url)
            } else {
                Text(item.url.absoluteString+"解析失败")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: "http://localhost:8090/api/download/stream?path=sr.mp4") {
            DetailView(item: .constant(Item(url: url, name: String("sr.mp4"))))
        }
    }
}

