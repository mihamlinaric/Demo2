//
//  Quote.swift
//  Demo2Model
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation

public struct Quote: Codable, Identifiable, Hashable {
    public let id: String
    public var title: String
    public var description: String
    public let ownerId: String
    
    public var owner: User?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, ownerId
    }
    
    public init(id: String, title: String, description: String, ownerId: String) {
        self.id = id
        self.title = title
        self.description = description
        self.ownerId = ownerId
    }
}

extension Quote {
    public static let MOCK_QUOTES: [Quote] = [
        .init(id: NSUUID().uuidString, title: "qoute1", description: "description1", ownerId: "WfWvD8A1N8WvPJAnfEr3QY3okNt1"),
        .init(id: NSUUID().uuidString, title: "qoute2", description: "description2", ownerId: "eHGMC99eyRU5MfklfngGIZrImNA2"),
        .init(id: NSUUID().uuidString, title: "qoute3", description: "description3", ownerId: "WfWvD8A1N8WvPJAnfEr3QY3okNt1"),
        .init(id: NSUUID().uuidString, title: "qoute4", description: "description4", ownerId: "krSxXAvfVxZutTLCfVIfjJTjox42"),
        .init(id: NSUUID().uuidString, title: "qoute5", description: "description5", ownerId: "eHGMC99eyRU5MfklfngGIZrImNA2")
    ]
}
