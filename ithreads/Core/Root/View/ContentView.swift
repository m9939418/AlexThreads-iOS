//
//  ContentView.swift
//  ithreads
//
//  Created by Alex YANG 楊明仁 on 2024/12/2.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabBarView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
