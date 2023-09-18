//
//  AuthenticationProtocol.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import Foundation
import Demo2Model

protocol AuthenticationProtocol {
    var userSessionId: String? { get }
    var currentUser: Demo2Model.User? { get }
    var currentUserPublisher: Published<Demo2Model.User?>.Publisher { get }
    
    func isCurrentUser(uid: String) -> Bool
    func loadUserData() async throws
    func login(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String) async throws
    func removeAccount() throws
    func signOut() throws
}
