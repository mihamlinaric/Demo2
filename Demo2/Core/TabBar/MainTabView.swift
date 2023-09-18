//
//  MainTabVIew.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI
import Demo2Model

enum Tab {
    case home
    case userList
}

struct MainTabView: View {
    @State private var selected: Tab = Tab.home
    let user: Demo2Model.User
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView(user: user)
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
        MainTabView(user: User.MOCK_USERS[0])
    }
}
