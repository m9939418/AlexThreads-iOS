//
// CurrentUserProfileView.swift
// ithreads
//
// Created by AlexYang on 2024/12/16.
//


import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false    
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    // Follow Button
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .frame(width: 352, height: 32)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            }
                    }
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
//                EditProfileView()
//                    .environmentObject(viewModel)
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
