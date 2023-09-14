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
import Demo2Utility

public class UserService: UserProtocol {

    private static let userService = FirestoreUserService()
    
    static public func fetchUser(uid: String) async throws -> User? {
        return try await userService.fetchUserData(uid)
    }
    
    static public func fetchAllUsers() async throws -> [User] {
        return try await userService.fetchAllUsersData()
    }
    
    static public func createUser(username: String, age: Int, uiImage: UIImage?) async throws {
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, storagePath: FirebaseStorageConstants.profileImage) else { return }
        
        try await userService.createUser(username: username, age: age, imageUrl: imageUrl)
    }
}
