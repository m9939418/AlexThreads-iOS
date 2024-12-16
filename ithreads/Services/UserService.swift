//
// UserService.swift
// ithreads
//
// Created by AlexYang on 2024/12/13.
//


import FirebaseAuth
import FirebaseFirestore


class UserService {
    static let shared = UserService()
    
    @Published var currentUser: User?
    
     
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: User is \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { document in
            try? document.data(as: User.self)
        }
        return users.filter({ $0.id != currentUserId })
    }
    
    func resetUser() {
        self.currentUser = nil
    }
}
