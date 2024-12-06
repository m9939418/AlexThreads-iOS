//
// UserCell.swift
// ithreads
//
// Created by AlexYang on 2024/12/5.
//


import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text("max-versionappen")
                    .fontWeight(.semibold)
                Text("Max Version Oppen")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
