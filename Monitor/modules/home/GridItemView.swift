//
//  GridItemView.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct GridItemView: View {

    let item: Item
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if item.url.isImage() {
                ImageSecure(url: item.url)
            } else if item.url.isVideo() {
                Rectangle()
                    .overlay {
                        Text(item.name)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 200)
                            .foregroundStyle(.yellow.gradient)
                    }
            } else {
                Rectangle()
                    .overlay {
                        Text("未知文件")
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 200)
                            .foregroundStyle(.yellow.gradient)
                    }
            }
        }
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: "http://localhost:8090/api/download/stream?path=sr.mp4") {
            GridItemView(item: Item(url: url, name: String("sr.mp4")))
        }
    }
}

