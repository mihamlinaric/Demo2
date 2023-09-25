//
//  FirestoreQuoteService.swift
//  Demo2Firestore
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Model
import FirebaseFirestore
import FirebaseFirestoreSwift

public struct FirestoreQuoteService: FirestoreQuoteProtocol {
    public init() {
    }
    
    public func fetchQuote(id: String) async throws -> Quote? {
        let snapshot = try await FirestoreConstants.quotesCollection.document(id).getDocument()
        return try? snapshot.getData(as: Quote.self)
    }
    
    public func fetchAllQuotes() async throws -> [Quote] {
        let snapshot = try await FirestoreConstants.quotesCollection.getDocuments()
        return snapshot.getData(as: Quote.self)
    }
    
    public func createQuote(title: String, description: String, ownerId: String) async throws -> Quote? {
        let ref = FirestoreConstants.quotesCollection.document()
        let quote = Quote(id: ref.documentID, title: title, description: description, ownerId: ownerId)
        guard let encodedQuote = try? Firestore.Encoder().encode(quote) else { return nil}
        try await ref.setData(encodedQuote)
        
        return quote
    }
    
    public func deleteQuote(id: String) async throws {
        try await FirestoreConstants.quotesCollection.document(id).delete()
    }
}
