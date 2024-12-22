//
// ThreadService.swift
// ithreads
//
// Created by AlexYang on 2024/12/21.
//


import Foundation
import FirebaseFirestore

struct ThreadService {
    
    /** 更新資料庫- [threads] Table  */
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
