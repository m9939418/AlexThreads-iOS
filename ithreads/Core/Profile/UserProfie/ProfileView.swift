//
//  ProfileView.swift
//  ithreads
//
//  Created by Alex YANG on 2024/12/4.
//


import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                // Follow Button
                Button {
                    
                } label: {
                    Text("Follow")
                        .frame(width: 352, height: 32)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color(.black))
                        .cornerRadius(8)
                }

                UserContentListView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
