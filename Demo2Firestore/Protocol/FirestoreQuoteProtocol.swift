//
//  FirestoreQuoteProtocol.swift
//  Demo2Firestore
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Model

protocol FirestoreQuoteProtocol {
    func fetchQuote(id: String) async throws -> Quote?
    func fetchAllQuotes() async throws -> [Quote]
    func createQuote(title: String, description: String, ownerId: String) async throws -> Quote?
    func deleteQuote(id: String) async throws
}
