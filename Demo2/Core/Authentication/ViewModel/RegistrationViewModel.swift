//
//  RegistrationViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Demo2Business

final class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var age: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var image: Image?
    var uiImage: UIImage?
    
    let service = Interface.auth()
    
    @MainActor
    func loadImage() async {
        guard let item = self.selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.image = Image(uiImage: uiImage)
    }
    
    func createUser() async throws {
        try await service.createUser(withEmail: email, password: password)
        guard let uid = service.userSessionId, let age = Int(age) else { return }
        guard let _ = try await UserService.createUser(uid: uid, username: username, age: age, email: email, uiImage: uiImage) else { return }
        try await service.loadUserData()
    }

}
