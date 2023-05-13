//
//  ImageSecure.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

@ViewBuilder
func ImageSecure(url: URL) -> some View {
    CustomAsyncImage(getImage: { await getImageSecure(url: url) }) { image in
      image
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity)
    } placeholder: {
        ProgressView()
    }
}



