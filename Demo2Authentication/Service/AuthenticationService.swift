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
    
    /// instance that tells us if user is logged in or not
    @Published public var userSession: FirebaseAuth.User?
    /// instance of our user object
    @Published public var currentUser: Demo2Model.User?
    
    @MainActor
    public func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    public func createUser(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    public func removeAccount() throws {
        Auth.auth().currentUser?.delete()
        try self.signOut()
    }
    
    public func signOut() throws {
        try Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
}
