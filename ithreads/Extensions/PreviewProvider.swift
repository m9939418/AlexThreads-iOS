//
// PreviewProvider.swift
// ithreads
//
// Created by AlexYang on 2024/12/16.
//


import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Mav Verxivon", email: "aalev@gamil.com", username: "mavverxivon")
}
