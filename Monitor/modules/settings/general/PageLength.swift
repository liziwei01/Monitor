//
//  PageLength.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct PageLengthView: View {
    @State var confLocal = conf
    
    var body: some View {
        NavigationView {
            Form{
                TextField(
                    "PAGE LENGTH",
                    value: $confLocal.PageLength,
                    formatter: NumberFormatter()
                )
            }
        }.navigationBarTitle("页长")
    }
}

struct PageLengthView_Previews: PreviewProvider {
    static var previews: some View {
        PageLengthView()
    }
}


