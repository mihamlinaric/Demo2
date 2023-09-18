//
//  TextFieldModifier.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .autocapitalization(.none)
            .autocorrectionDisabled()
    }
}
