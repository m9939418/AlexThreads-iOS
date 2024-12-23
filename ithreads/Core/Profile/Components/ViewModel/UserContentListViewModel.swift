//
// UserContentListViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/23.
//


import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        self.threads = try await ThreadService.fetchUserThread(uid: user.id)
    }
}
