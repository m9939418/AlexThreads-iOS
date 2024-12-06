//
// CircularProfileImageView.swift
// ithreads
//
// Created by AlexYang on 2024/12/5.
//


import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("profile_demo")
            .resizable()
            .frame(width: 40, height: 40)
            .scaledToFill()
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
