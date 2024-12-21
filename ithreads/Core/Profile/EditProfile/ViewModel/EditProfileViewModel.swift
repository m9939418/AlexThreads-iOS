//
// EditProfileViewModel.swift
// ithreads
//
// Created by AlexYang on 2024/12/18.
//


import Foundation
import SwiftUI
import _PhotosUI_SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    /** */
    func updateUserData() async throws {
        print("Update user data here ...")
        try await uploadProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    /** 執行上傳 User 大頭照 to Firebase Storge  */
    /** 執行更新 User 大頭照 to Firebase Database*/
    @MainActor
    private func uploadProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.uploadUserProfileImage(withImageUrl: imageUrl)
    }
}
