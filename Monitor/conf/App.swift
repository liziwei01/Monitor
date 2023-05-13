//
//  App.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

class Conf: ObservableObject {
    
    @Published var PrivateKey: String
    @Published var ServerIP: String
    @Published var DownloadRouterFormat: String
    @Published var PageRouterFormat: String
    @Published var PageLength: Int
    
    init() {
        PrivateKey = """
        ljg
        """
        ServerIP = "http://localhost:8090"
        DownloadRouterFormat = "/api/download/stream?path=%@"
        PageRouterFormat = "/api/download/page?page=%@&pageLength=%@"
        PageLength = 10
    }
}

var conf: Conf = Conf()
