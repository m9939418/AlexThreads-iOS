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
        
        try await Firestore
            .firestore()
            .collection("threads")
            .addDocument(data: threadData)
    }
    
    /** 取得 [threads] Table  列表 */
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    /** 取得該使用者所有 Threads 列表 */
    static func fetchUserThread(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
