//
//  AuthenticationService.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import Foundation
import Combine
import Demo2Model
import Demo2Authentication

public class AuthenticationService: AuthenticationProtocol {
    
    public init() {
        Task { try await loadUserData() }
    }
    
    public var userSessionId: String? {
        return _authentication.userSession?.uid
    }
    
    public var currentUser: Demo2Model.User? {
        return _authentication.currentUser
    }
    
    public var currentUserPublisher: Published<Demo2Model.User?>.Publisher {
        return _authentication.$currentUser
    }
    
    public func isCurrentUser(uid: String) -> Bool {
        return uid == userSessionId
    }
    
    @MainActor
    public func loadUserData() async throws {
        _authentication.loadUserSession()
        
        guard let uid = self.userSessionId else { return }
        guard let user = try await UserService.fetchUser(uid: uid) else { return }
        return _authentication.setCurrentUser(user: user)
    }
    
    public func login(withEmail email: String, password: String) async throws {
        try await _authentication.login(withEmail: email, password: password)
    }
    
    public func createUser(withEmail email: String, password: String) async throws {
        try await _authentication.createUser(withEmail: email, password: password)
    }
    
    @MainActor
    public func removeAccount() throws {
        try _authentication.removeAccount()
    }
    
    @MainActor
    public func signOut() throws {
        try _authentication.signOut()
    }
    
    private let _authentication = Demo2Authentication.AuthenticationService()
}
