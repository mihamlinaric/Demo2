//
//  FirestoreConstants.swift
//  Demo2Firestore
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import Foundation
import FirebaseFirestore

struct FirestoreConstants {
    static let usersCollection = Firestore.firestore().collection("users")
    static let quotesCollection = Firestore.firestore().collection("quotes")
}
