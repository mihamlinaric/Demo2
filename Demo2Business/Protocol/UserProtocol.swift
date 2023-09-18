//
//  UserProtocol.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import SwiftUI
import Demo2Model

protocol UserProtocol {
    static func fetchUser(uid: String) async throws -> User?
    static func fetchAllUsers() async throws -> [User]
    static func createUser(uid: String, username: String, age: Int, email: String, uiImage: UIImage?) async throws -> User?
    static func updateUser(uid: String, data: [String: Any]) async throws
    static func removeUser(uid: String) async throws
}
