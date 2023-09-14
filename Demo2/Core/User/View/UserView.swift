//
//  UserView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Model

struct UserView: View {
    @StateObject var viewModel = UserViewModel()
    @State private var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            Text(user.username)
                            
                            Spacer()
                            
                            Text("\(user.age)")
                        }
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
            CreateUserView()
                .presentationDetents([.large])
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
