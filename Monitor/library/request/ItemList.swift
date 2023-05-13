//
//  ItemList.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI


func GetItemList(pageIdx: Int) -> ([Item], Int) {
    let (fileList, count) = getFileList(i: pageIdx)
    let itemList = fileList.map { file in
        Item(url: URL(string: String(format: conf.ServerIP + conf.DownloadRouterFormat, file))!, name: file)
    }
    var pageNum = count / conf.PageLength
    if count % conf.PageLength != 0 {
        pageNum = pageNum + 1
    }
    
    return (itemList, pageNum)
}

func getFileList(i: Int) -> ([String], Int) {
    let idx = i - 1
    let url = URL(string: String(format: conf.ServerIP + conf.PageRouterFormat, String(idx), String(conf.PageLength)))!
    let data = GetSecure(url: url)
    if data.count == 0 {
        return ([], 0)
    } else {
        if let list = data["list"] as? [String] {
            if let count = data["count"] as? Int {
                return (list, count)
            }
        }
    }
    
    return ([], 0)
}
