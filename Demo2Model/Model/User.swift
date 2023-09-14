//
//  User.swift
//  Demo2Model
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation

public struct User: Codable, Identifiable, Hashable {
    public var id: String
    public let username: String
    public var age: Int
    public var imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
            case id, username, age, imageUrl
    }
    
    public init(id: String, username: String, age: Int, imageUrl: String? = nil) {
        self.id = id
        self.username = username
        self.age = age
        self.imageUrl = imageUrl
    }
}

extension User {
    public static let MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "user1", age: 1),
        .init(id: NSUUID().uuidString, username: "user2", age: 2),
        .init(id: NSUUID().uuidString, username: "user3", age: 3),
        .init(id: NSUUID().uuidString, username: "user4", age: 4),
        .init(id: NSUUID().uuidString, username: "user5", age: 5)
    ]
}
