//
//  Settings.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            NavigationView {
                Form{
                    Section(header: Text("连接")) {
                        NavigationLink("远程连接") {
                            LinkView()
                        }
                    }
                    Section(header: Text("通用")) {
                        NavigationLink("通用") {
                            GeneralView()
                        }
                    }
                }
            }
        }
        .navigationBarTitle("设置")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

