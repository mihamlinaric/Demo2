//
//  FirestoreUserService.swift
//  Demo2Firestore
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Demo2Model

public struct FirestoreUserService: FirestoreUserProtocols {
    public init() { }
    
    public func fetchUserData(_ uid: String) async throws -> User? {
        let snapshot = try await FirestoreConstants.usersCollection.document(uid).getDocument()
        return try? snapshot.getData(as: User.self)
    }
    
    public func fetchAllUsersData() async throws -> [User] {
        let snapshot = try await FirestoreConstants.usersCollection.getDocuments()
        return snapshot.getData(as: User.self)
    }
    
    public func createUser(username: String, age: Int, imageUrl: String?) async throws -> User? {
        let ref = FirestoreConstants.usersCollection.document()
        let user = User(id: ref.documentID, username: username, age: age, imageUrl: imageUrl)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return nil }
        try await ref.setData(encodedUser)
        
        return user
    }
    
    public func updateUserData(_ uid: String, data: [String : Any]) async throws {
        try await FirestoreConstants.usersCollection.document(uid).updateData(data)
    }
    
    public func removeUserData(_ uid: String) async throws {
        try await FirestoreConstants.usersCollection.document(uid).delete()
    }
}
