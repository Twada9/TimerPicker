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
    func getHour() -> Int {
        return Int(self) / 3600
    }
    func getMinute() -> Int {
        return Int(self) / 60
    }
    func getSecond() -> Int {
        return Int(self) % 60
    }
}
