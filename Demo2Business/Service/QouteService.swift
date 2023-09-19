//
//  QouteService.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Model
import Demo2Firestore

public class QouteService: QuoteProtocol {
    public static func fetchQuote(id: String) async throws -> Quote? {
        guard var quote = try? await FirestoreQuoteService().fetchQuote(id: id) else { return nil }
        let owner = try? await UserService.fetchUser(uid: quote.ownerId)
        quote.owner = owner
        return quote
    }
    
    public static func fetchAllQuotes() async throws -> [Quote] {
        guard var quotes = try? await FirestoreQuoteService().fetchAllQuotes() else { return [] }
        for i in quotes.indices {
            let owner = try? await UserService.fetchUser(uid: quotes[i].ownerId)
            quotes[i].owner = owner
        }
        return quotes
    }
    
    @discardableResult
    public static func createQuote(title: String, description: String) async throws -> Quote? {
        guard let ownerId = Interface.auth().userSessionId else { return nil }
        return try await FirestoreQuoteService().createQuote(title: title, description: description, ownerId: ownerId)
    }
    
    public static func deleteQuote(id: String) async throws {
        return try await FirestoreQuoteService().deleteQuote(id: id)
    }
}
