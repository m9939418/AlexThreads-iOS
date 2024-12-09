//
// ProfileThreadFilter.swift
// ithreads
//
// Created by AlexYang on 2024/12/6.
//


import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue}
}
