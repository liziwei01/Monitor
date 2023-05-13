//
//  PrivateKey.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct PrivateKeyView: View {
    @State var confLocal = conf
    
    var body: some View {
        NavigationView {
            Form{
                TextField(
                    "PRIVATE KEY",
                    text: $confLocal.PrivateKey
                )
            }
        }.navigationBarTitle("私钥")
    }
}

struct RSAPrivateKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateKeyView()
    }
}

