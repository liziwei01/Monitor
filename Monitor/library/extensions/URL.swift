//
//  URL.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI
import PhotosUI
import Foundation

extension URL {
    func isImage() -> Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]

        return hasItemWithSupportedExtensions(supportedExtensions: imageExtensions)
    }
    
    func isVideo() -> Bool {
        let videoExtensions = ["mp4"]
        
        return hasItemWithSupportedExtensions(supportedExtensions: videoExtensions)
    }
    
    func hasItemWithSupportedExtensions(supportedExtensions: [String]) -> Bool {
        guard let item = self.queryParameters?["path"] else {
            return false
        }
        
        let itemComponents = item.components(separatedBy: ".")
        guard let extensionString = itemComponents.last else {
            return false
        }
        
        return supportedExtensions.contains(extensionString)
    }
    
    private var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return nil
        }
        
        let parameters = queryItems.compactMap { ($0.name, $0.value) as? (String, String) }
        return Dictionary(uniqueKeysWithValues: parameters)
    }
}

