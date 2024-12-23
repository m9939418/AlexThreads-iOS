//
// ProfileHeaderView.swift
// ithreads
//
// Created by AlexYang on 2024/12/16.
//


import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio).font(.footnote)
                }
                
                Text("30 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

//#Preview {
//    ProfileHeaderView()
//}
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
