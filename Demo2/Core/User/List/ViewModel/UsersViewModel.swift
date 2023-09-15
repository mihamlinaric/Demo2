//
//  UsersViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Demo2Model
import Demo2Business

final class UsersViewModel: ObservableObject {
    @Published var users: [String: User] = [:]
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        let fetchedUsers = try await UserService.fetchAllUsers()
        for user in fetchedUsers {
            self.users[user.id] = user
        }
    }
    
    @MainActor
    func createUser(username: String, age: String, uiImage: UIImage?) async throws {
        guard let age = Int(age) else { return }
        guard let user = try await UserService.createUser(username: username, age: age, uiImage: uiImage) else { return }
        self.users[user.id] = user
    }
    
    @MainActor
    func removeUser(uid: String) async throws {
        self.users.removeValue(forKey: uid)
        try await UserService.removeUser(uid: uid)
    }
    
    @MainActor
    func updateUser(uid: String, data: [String: Any]) async throws {
        guard var user = self.users[uid] else { return }
        if let age = data["age"] as? Int{
            user.age = age
            self.users[uid] = user
        }
        try await UserService.updateUser(uid: uid, data: data)
    }
}
