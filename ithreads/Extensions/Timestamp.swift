//
// Timestamp.swift
// ithreads
//
// Created by AlexYang on 2024/12/23.
//


import Foundation
import FirebaseFirestore

extension Timestamp {
    
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? "剛剛"
    }
}
