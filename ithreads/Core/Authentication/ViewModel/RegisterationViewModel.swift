//
// RegisterationViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/10.
//


import Foundation

class RegisterationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Create user here ...")
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
        
    }
    
    
    
}
