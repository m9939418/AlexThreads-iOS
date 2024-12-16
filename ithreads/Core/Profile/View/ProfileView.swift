//
//  ProfileView.swift
//  ithreads
//
//  Created by Alex YANG on 2024/12/4.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBraWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text(viewModel.currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("aklkjlkjlwevallAA")
                                    .font(.subheadline)
                            }
                                            
                            Text("lkjoijKKjHEWIU")
                                .font(.footnote)

                            Text("30 followers")
                                .font(.caption)
                                .foregroundColor(.gray)

                        }
                        
                        Spacer()
                        
                        
                        
                        CircularProfileImageView()
                    }
                    
                    
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

            
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBraWidth, height: 5)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBraWidth, height: 5)
                                    }
                                    
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        
                        
                        LazyVStack {
                            ForEach( 0 ... 20, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    
                    
                    
                }
            }
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
    ProfileView()
}
