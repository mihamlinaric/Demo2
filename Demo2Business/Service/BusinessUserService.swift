//
//  BusinessUserService.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import SwiftUI
import Demo2Model
import Demo2Firestore
import Demo2Storage

public class BusinessUserService: BusinessUserProtocol {
    
    public static let shared = BusinessUserService()
    let userService = Demo2Firestore.FirestoreUserService()
    
    public func fetchUser(uid: String) async throws -> User? {
        return try await userService.fetchUserData(uid)
    }
    
    public func fetchAllUsers() async throws -> [User] {
        return try await userService.fetchAllUsersData()
    }
    
    public func createUser(username: String, age: Int, uiImage: UIImage?) async throws {
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await Demo2Storage.ImageUploader.uploadImage(image: uiImage) else { return }
        
        try await userService.createUser(username: username, age: age, imageUrl: imageUrl)
    }
}
