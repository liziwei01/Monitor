//
//  Link.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        VStack{
            NavigationView {
                Form{
                    Section(header: Text("秘钥")) {
                        NavigationLink("私钥") { PrivateKeyView() }
                    }
                    Section(header: Text("服务器")) {
                        NavigationLink("服务器地址") { ServerView() }
                    }
                }
            }
        }.navigationBarTitle("远程连接")
    }
}

struct Link_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
