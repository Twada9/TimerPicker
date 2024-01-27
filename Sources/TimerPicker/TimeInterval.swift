//
//  TimeInterval.swift
//
//
//  Created by wada on 2024/01/27.
//

import Foundation

extension TimeInterval {
    func convert() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    func toHour() -> Int {
        return Int(self) / 3600
    }
    func toMinute() -> Int {
        return (Int(self) % 3600) / 60
    }
    func toSecond() -> Int {
        return Int(self) % 60
    }
}
