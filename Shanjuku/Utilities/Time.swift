//
//  Timer.swift
//  Shanjuku
//
//  Created by 張家睿 on 2024/2/9.
//

import Foundation

struct TimeDifferenceHelper {
    private var startTime: Date?
    private var endTime: Date?
    private var timeInterval: TimeInterval? {
        guard let startDate = self.startTime, let endDate = self.endTime else {
            return nil
        }
        
        return endDate.timeIntervalSince(startDate)
    }
    
    init(startTime: Date?, endTime: Date?) {
        self.startTime = startTime
        self.endTime = endTime
    }
    
    init(startTime: String, endTime: String, format: String) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        
        self.startTime = formatter.date(from: startTime)
        self.endTime = formatter.date(from: endTime)
    }
    
    func IntervalToString() -> String? {
        guard let timeInterval = self.timeInterval else {
            return nil
        }
        
        let formatter = DateComponentsFormatter()

        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: timeInterval)
    }
}
