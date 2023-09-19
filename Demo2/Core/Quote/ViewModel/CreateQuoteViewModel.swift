//
//  CreateQuoteViewModel.swift
//  Demo2
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import Foundation
import Demo2Business

final class CreateQuoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    
    init() { }
    
    func createQuote() async throws {
        try await QouteService.createQuote(title: title, description: description)
    }
}
