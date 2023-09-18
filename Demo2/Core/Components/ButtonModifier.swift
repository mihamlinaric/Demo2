//
//  ButtonModifier.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 36)
            .overlay {
                RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 1)
            }
    }
}
