//
//  ContentView.swift
//  Demo2
//
//  Created by Miha Mlinaric on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var  viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.currentUser == nil {
//                LoginView()
                MainTabView()
            } else {
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
