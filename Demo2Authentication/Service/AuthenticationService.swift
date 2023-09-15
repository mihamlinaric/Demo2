//
//  AuthenticationService.swift
//  Demo2Authentication
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import Foundation
import FirebaseAuth
import Demo2Model

public class AuthenticationService {
    public init() { }
    
    @Published public var currentUser: Demo2Model.User?
    
    @MainActor
    /// logs user in using FirebaseAuth
    /// - Parameters:
    ///   - email: instance of email String
    ///   - password: instance of  password String
    public func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
//            try await loadUserData()
    }
}
