//
//  CreateQuoteView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import SwiftUI

struct CreateQuoteView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = CreateQuoteViewModel()
    
    var body: some View {
        VStack {
            Group {
                TextField("Enter title", text: $viewModel.title)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                TextField("Enter description", text: $viewModel.description)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            }
            .padding(.horizontal)
            
            Button("Create quote") {
                Task { try await viewModel.createQuote() }
                dismiss()
            }
            .padding(.top, 24)
        }
    }
}

struct CreateQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateQuoteView()
    }
}
