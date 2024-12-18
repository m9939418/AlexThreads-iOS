//
// CurrentUserProfileViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/16.
//


import Foundation
import Combine
import SwiftUI
import _PhotosUI_SwiftUI


class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    private var cancelable = Set<AnyCancellable>()
   
    
    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine in \(user)")
        }.store(in: &cancelable)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}

