//
//  Mapper.swift
//  Demo2Firestore
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

extension DocumentSnapshot {
    func getData<T>(as type: T.Type) throws -> T where T: Decodable {
        return try self.data(as: T.self)
    }
}

extension QuerySnapshot {
    func getData<T>(as type: T.Type) -> [T] where T: Decodable {
        return self.documents.compactMap { try? $0.data(as: T.self)}
    }
}
