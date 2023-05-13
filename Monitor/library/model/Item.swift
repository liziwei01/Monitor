//
//  Item.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

struct Item: Identifiable {

    let id = UUID()

    let url: URL
    
    let name: String
    
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
}

