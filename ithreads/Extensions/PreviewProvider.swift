//
// PreviewProvider.swift
// ithreads
//
// Created by AlexYang on 2024/12/16.
//


import SwiftUI
import FirebaseFirestore

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Mav Verxivon", email: "aalev@gamil.com", username: "mavverxivon")
    
    let thread = Thread(ownerUid: "1234", caption: "This is a test thread", timestamp: Timestamp(), likes: 3)
}
