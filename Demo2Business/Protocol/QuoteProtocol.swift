//
//  QuoteProtocol.swift
//  Demo2Business
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Model

protocol QuoteProtocol {
    static func fetchQuote(id: String) async throws -> Quote?
    static func fetchAllQuotes() async throws -> [Quote]
    static func createQuote(title: String, description: String) async throws -> Quote?
    static func deleteQuote(id: String) async throws
}
