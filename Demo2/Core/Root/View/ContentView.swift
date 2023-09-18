//
//  ContentView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import SwiftUI
import Demo2Model

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.currentUser == nil {
                LoginView()
            } else if let user = viewModel.currentUser {
                MainTabView(user: user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
