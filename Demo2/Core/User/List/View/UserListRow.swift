//
//  UserListRow.swift
//  Demo2
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import SwiftUI
import Demo2Model

struct UserListRow: View {
    @EnvironmentObject var usersViewModel: UsersViewModel
    let user: User
    
    @StateObject var viewModel = UserListRowViewModel()
    @State private var editUserIsShowing: Bool = false
    
    var body: some View {
        HStack {
            Text(user.username)
                .padding(.trailing, 12)
            Text("\(user.age)")
            
            Spacer()
            
            // edit user
            Button {
                editUserIsShowing.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
            }
            
            // remove user
            if viewModel.isCurrentUser(uid: user.id) {
                Button {
                    Task { try await usersViewModel.removeUser(uid: user.id) }
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.horizontal, .bottom], 6)
        .sheet(isPresented: $editUserIsShowing) {
            EditUserView(user: user)
        }
    }
}

struct UserListRow_Previews: PreviewProvider {
    static var previews: some View {
        UserListRow(user: User.MOCK_USERS[0])
    }
}
