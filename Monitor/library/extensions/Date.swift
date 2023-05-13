//
//  Date.swift
//  Monitor
//
//  Created by 李子为 on 5/12/23.
//

import SwiftUI

extension Date {
    func truncatedToHalfMinuteUnix() -> Int64 {
        let roundedNow = self.truncatedToHalfMinute()
        return Int64(roundedNow.timeIntervalSince1970)
    }
    
    func truncatedToHalfMinute() -> Date {
        let interval = timeIntervalSinceReferenceDate
        let halfMinuteInterval = round(interval / 30) * 30
        return Date(timeIntervalSinceReferenceDate: halfMinuteInterval)
    }
}

