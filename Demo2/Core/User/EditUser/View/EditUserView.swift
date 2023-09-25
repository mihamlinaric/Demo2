//
//  EditUserView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 15/09/2023.
//

import SwiftUI
import Demo2Model

struct EditUserView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var usersViewModel: UsersViewModel
    @StateObject var viewModel: EditUserViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditUserViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                if let imageUrl = viewModel.user.imageUrl {
                    CircularImage(imageUrl: imageUrl, size: ImageSize.large)
                }
            }
            
            HStack {
                Text("username: ")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.trailing, 4)
                    .frame(width: UIScreen.main.bounds.width / 5, alignment: .leading)
                
                TextField("Enter your username...", text: $viewModel.username)
                
                Spacer()
            }
            .padding(.top, 12)
            .padding(.horizontal)
            
            HStack {
                Text("age: ")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.trailing, 4)
                    .frame(width: UIScreen.main.bounds.width / 5, alignment: .leading)
                
                TextField("Enter your age...", text: $viewModel.age)
                
                Spacer()
            }
            .padding(.top, 12)
            .padding(.horizontal)
            
            Button {
                viewModel.loadData()
                Task { try await usersViewModel.updateUser(uid: viewModel.user.id, data: viewModel.data) }
                dismiss()
            } label: {
                Text("Update User")
            }

        }
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(user: User.MOCK_USERS[0])
    }
}
