//
//  UserListRow.swift
//  Demo2
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import SwiftUI
import Demo2Model

struct UserListRow: View {
    @ObservedObject var viewModel: UsersViewModel
    let user: User
    
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
            Button {
                Task { try await viewModel.removeUser(uid: user.id) }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .imageScale(.large)
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.horizontal, .bottom], 6)
        .sheet(isPresented: $editUserIsShowing) {
            EditUserView(usersViewModel: viewModel, user: user)
        }
    }
}

struct UserListRow_Previews: PreviewProvider {
    static var previews: some View {
        UserListRow(viewModel: UsersViewModel(), user: User.MOCK_USERS[0])
    }
}
