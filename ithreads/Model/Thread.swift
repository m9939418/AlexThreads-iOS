//
// Thread.swift
// ithreads
//
// Created by AlexYang on 2024/12/21.
//


import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
