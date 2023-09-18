//
//  AuthenticationService.swift
//  Demo2Authentication
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import Foundation
import FirebaseAuth
import Demo2Model

public class AuthenticationService: AuthenticationProtocol {
    public init() { }
    
    /// instance that tells us if user is logged in or not
    @Published public var userSession: FirebaseAuth.User?
    /// instance of our user object
    @Published public var currentUser: Demo2Model.User?
    
    
    @MainActor
    public func loadUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    public func setCurrentUser(user: Demo2Model.User) {
        self.currentUser = user
    }
    
    @MainActor
    public func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    @MainActor
    public func createUser(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    @MainActor
    public func removeAccount() throws {
        Auth.auth().currentUser?.delete()
        try self.signOut()
    }
    
    @MainActor
    public func signOut() throws {
        try Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
}
