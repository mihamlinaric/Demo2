//
//  BusinessUserService.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import SwiftUI
import Demo2Firestore
import Demo2Storage
import Demo2Model
import Demo2Utility

public class UserService: UserProtocol {
    private init() { }
    
    static public func fetchUser(uid: String) async throws -> User? {
        return try await FirestoreUserService().fetchUserData(uid)
    }
    
    static public func fetchAllUsers() async throws -> [User] {
        return try await FirestoreUserService().fetchAllUsersData()
    }
    
    static public func createUser(uid: String, username: String, age: Int, email: String, uiImage: UIImage?) async throws -> User? {
        guard let uiImage = uiImage else { return nil }
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, storagePath: FirebaseStorageConstants.profileImage) else { return nil }
        
        guard let user = try await FirestoreUserService().createUser(uid: uid, username: username, age: age, email: email, imageUrl: imageUrl) else { return nil }
        return user
    }
    
    static public func updateUser(uid: String, data: [String: Any]) async throws {
        try await FirestoreUserService().updateUserData(uid, data: data)
    }
    
    static public func removeUser(uid: String) async throws {
        try await FirestoreUserService().removeUserData(uid)
    }
    
}
