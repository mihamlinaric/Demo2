//
//  QouteViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Model
import Demo2Business

final class QouteViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    
    init() {
        Task { try await setupQuotes() }
    }
    
    @MainActor
    func setupQuotes() async throws {
        self.quotes = try await QouteService.fetchAllQuotes()
    }
}
