//
//  CreateUserViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation
import Demo2Business
import SwiftUI
import PhotosUI

final class CreateUserViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var age: String = ""
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    
    func createUser() async throws {
        guard let age = Int(self.age) else { return }
        try await UserService.createUser(username: self.username, age: age, uiImage: self.uiImage)
    }
    
    @MainActor
    func loadImage() async {
        guard let item = self.selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
}
