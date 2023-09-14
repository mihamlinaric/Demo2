//
//  UserViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation
import Demo2Model
import Demo2Business

final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
