//
//  UserListView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Model

struct UserListView: View {
    @StateObject var viewModel = UsersViewModel()
    @State private var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(Array(viewModel.users.values)) { user in
                    NavigationLink(value: user) {
                        UserListRow(viewModel: viewModel, user: user)
                    }
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        .sheet(isPresented: $isSheetShowing) {
            CreateUserView(usersViewModel: viewModel)
                .presentationDetents([.large])
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
