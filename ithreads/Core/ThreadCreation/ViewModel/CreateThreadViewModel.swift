//
// CreateThreadViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/21.
//


import FirebaseAuth
import FirebaseCore

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
