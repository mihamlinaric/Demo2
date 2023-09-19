//
//  QuoteView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var viewModel = QouteViewModel()
    @State private var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.quotes) { quote in
                        QuoteRow(quote: quote)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Quotes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                CreateQuoteView()
                    .presentationDetents([.large])
            }
            .onAppear {
                Task {
                    do {
                        try await viewModel.setupQuotes()
                    } catch {
                        print("Error setting up quotes: \(error.localizedDescription)")
                    }
                }
            }

        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
