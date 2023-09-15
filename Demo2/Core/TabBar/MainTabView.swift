//
//  MainTabVIew.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI

enum Tab {
    case home
    case userList
}

struct MainTabView: View {
    @State private var selected: Tab = Tab.home
    var body: some View {
        TabView(selection: $selected) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(Tab.home)
            
            UserListView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(Tab.userList)
        }
        .accentColor(.black)
    }
}

struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
