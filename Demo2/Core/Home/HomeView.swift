//
//  HomeView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Business

struct HomeView: View {
    var body: some View {
        VStack {
            Button("Log out") {
                Task { try Interface.auth().signOut() }
            }
            .foregroundColor(Color(.systemBlue))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
