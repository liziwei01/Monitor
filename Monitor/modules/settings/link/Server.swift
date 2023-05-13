//
//  Server.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct ServerView: View {
    @State var confLocal = conf
    
    var body: some View {
        NavigationView {
            Form{
                TextField(
                    "127.0.0.1:8080",
                    text: $confLocal.ServerIP
                )
            }
        }.navigationBarTitle("服务器地址")
    }
}

struct ServerView_Previews: PreviewProvider {
    static var previews: some View {
        ServerView()
    }
}

