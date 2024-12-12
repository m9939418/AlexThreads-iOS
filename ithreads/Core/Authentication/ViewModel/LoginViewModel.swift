//
// LoginViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/12.
//


import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
