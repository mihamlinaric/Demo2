//
//  LoginView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .modifier(TextFieldModifier())
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Log in")
                        .modifier(ButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Don't have an account? ") +
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .padding(.vertical)

            }
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
