//
//  ThreadsTextFieldModifier.swift
//  ithreads
//
//  Created by Alex YANG 楊明仁 on 2024/12/3.
//

import Foundation
import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
