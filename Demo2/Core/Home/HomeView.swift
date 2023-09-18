//
//  HomeView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Business
import Demo2Model

struct HomeView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("Hello, \(user.username)")
                .padding(.bottom, 12)
            Button("Log out") {
                Task { try Interface.auth().signOut() }
            }
            .foregroundColor(Color(.systemBlue))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User.MOCK_USERS[0])
    }
}
