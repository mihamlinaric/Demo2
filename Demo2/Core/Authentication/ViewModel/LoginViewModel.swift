//
//  LoginViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import Foundation
import Demo2Business

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    let service = Interface.auth()
    
    func login() async throws {
        try await service.login(withEmail: email, password: password)
        guard let uid = service.userSession?.uid else { return }
        service.currentUser = try await UserService.fetchUser(uid: uid)
    }
}
