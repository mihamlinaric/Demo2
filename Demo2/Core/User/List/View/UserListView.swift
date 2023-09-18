//
//  UserListView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Model

struct UserListView: View {
    @StateObject var usersViewModel = UsersViewModel()
    @State private var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(Array(usersViewModel.users.values)) { user in
                    NavigationLink(value: user) {
                        UserListRow(user: user)
                            .environmentObject(usersViewModel)
                    }
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
