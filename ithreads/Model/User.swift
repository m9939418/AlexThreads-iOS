//
// User.swift
// ithreads
//
// Created by AlexYang on 2024/12/12.
//


import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
