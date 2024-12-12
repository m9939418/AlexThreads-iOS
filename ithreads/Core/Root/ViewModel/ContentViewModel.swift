//
// ContentViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/11.
//


import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancelable = Set<AnyCancellable>()
    
    init() {
        setupSubscription()
    }
    
    private func setupSubscription() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancelable)
    }
}
