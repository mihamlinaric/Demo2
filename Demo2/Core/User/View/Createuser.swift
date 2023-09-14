//
//  CreateUserView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import PhotosUI

struct CreateUserView: View {
    @Environment(\.dismiss) var dismiss
    @State private var imagePickerPresented = false
    @StateObject var viewModel = CreateUserViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("username", text: $viewModel.username)
            TextField("age", text: $viewModel.age)
            
            Button {
                Task { try await viewModel.createUser() }
                dismiss()
            } label: {
                Image(systemName: "paperplane")
            }
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
