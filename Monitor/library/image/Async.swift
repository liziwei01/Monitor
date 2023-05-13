//
//  Async.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct CustomAsyncImage<Content: View, Placeholder: View>: View {

  @State var uiImage: UIImage?

  let getImage: () async -> UIImage?
  let content: (Image) -> Content
  let placeholder: () -> Placeholder

  init(
      getImage: @escaping () async -> UIImage?,
      @ViewBuilder content: @escaping (Image) -> Content,
      @ViewBuilder placeholder: @escaping () -> Placeholder
  ){
      self.getImage = getImage
      self.content = content
      self.placeholder = placeholder
  }

  var body: some View {
      if let uiImage = uiImage {
          content(Image(uiImage: uiImage))
      }else {
          placeholder()
              .task {
                  self.uiImage = await getImage()
              }
      }
  }
}


func getImageSecure(url: URL) async -> UIImage? {
    var request = URLRequest(url: url)
    request.addValue(GetHashedString(conf.PrivateKey, Date().truncatedToHalfMinuteUnix()), forHTTPHeaderField: "Code")
    
    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching attchment") }
        
        return UIImage(data: data)
    } catch {
        return nil
    }
}
