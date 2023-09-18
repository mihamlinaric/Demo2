//
//  User.swift
//  Demo2Model
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation

public struct User: Codable, Identifiable, Hashable {
    public let id: String
    public var username: String
    public var age: Int
    public let email: String
    public var imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
            case id, username, age, email, imageUrl
    }
    
    public init(id: String, username: String, age: Int, email: String, imageUrl: String? = nil) {
        self.id = id
        self.username = username
        self.age = age
        self.email = email
        self.imageUrl = imageUrl
    }
}

extension User {
    public static let MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "user1", age: 1, email: "user1@gmail.com"),
        .init(id: NSUUID().uuidString, username: "user2", age: 2, email: "user2@gmail.com"),
        .init(id: NSUUID().uuidString, username: "user3", age: 3, email: "user3@gmail.com"),
        .init(id: NSUUID().uuidString, username: "user4", age: 4, email: "user4@gmail.com"),
        .init(id: NSUUID().uuidString, username: "user5", age: 5, email: "user5@gmail.com")
    ]
}
