//
//  RegistrationView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 18/09/2023.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel()
    @State private var imagePickerPresented = true
    
    var body: some View {
        VStack {
            
            if let image = viewModel.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 148, height: 148)
                    .clipShape(Circle())
            }
            
            TextField("Enter your username", text: $viewModel.username)
                .modifier(TextFieldModifier())
            
            TextField("Age", text: $viewModel.age)
                .modifier(TextFieldModifier())
            
            TextField("Email", text: $viewModel.email)
                .modifier(TextFieldModifier())
            
            SecureField("Password", text: $viewModel.password)
                .modifier(TextFieldModifier())
            
            Button {
                Task { try await viewModel.createUser() }
                dismiss()
            } label: {
                Text("Register")
                    .modifier(ButtonModifier())
            }

        }
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: . navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
            }
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
