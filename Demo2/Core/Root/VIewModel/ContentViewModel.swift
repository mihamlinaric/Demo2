//
//  ContentViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import Demo2Business
import Demo2Model

final class ContentViewModel: ObservableObject {
    let userService = Demo2Business.BusinessUserService.shared
    @Published var user: User?
    
    @MainActor
    func fetchUser() async throws {
        self.user = try await userService.fetchUser(uid: "5qdWoLh6H9lLoELUkRk4")
    }
}
