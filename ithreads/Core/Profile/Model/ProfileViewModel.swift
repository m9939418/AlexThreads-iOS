//
// ProfileViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/13.
//


import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancelable = Set<AnyCancellable>()
   
    
    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine in \(user)")
        }.store(in: &cancelable)
    }
}
