//
//  QuoteRow.swift
//  Demo2
//
//  Created by Miha Mlinaric on 19/09/2023.
//

import SwiftUI
import Demo2Model

struct QuoteRow: View {
    let quote: Quote
    let colors: [Color] = [.red, .orange, .purple, .blue, .cyan, .green]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(quote.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text(quote.owner?.username ?? "")
                    .font(.footnote)
            }
            
            Text(quote.description)
                .font(.subheadline)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(colors.randomElement() ?? .yellow, lineWidth: 2)
        }
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRow(quote: Quote.MOCK_QUOTES[0])
    }
}
