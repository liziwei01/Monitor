//
//  General.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct GeneralView: View {
    var body: some View {
        VStack{
            NavigationView {
                Form{
                    Section(header: Text("页")) {
                        NavigationLink("页长") { PageLengthView() }
                    }
                }
            }
        }.navigationBarTitle("通用")
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
