//
//  ThreadsTabBarView.swift
//  ithreads
//
//  Created by Alex YANG 楊明仁 on 2024/12/3.
//

import SwiftUI

struct ThreadsTabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName:  selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .tag(0)
                              
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            CreateThreadView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName:  selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName:  selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .tag(4)
            
        }
        .tint(.black)

    }
}

#Preview {
    ThreadsTabBarView()
}
