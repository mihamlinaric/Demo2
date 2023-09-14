//
//  MainTabVIew.swift
//  Demo2
//
//  Created by Miha Mlinaric on 14/09/2023.
//

import SwiftUI

enum Tab {
    case home
    case user
}

struct MainTabView: View {
    @State private var selected: Tab = Tab.home
    var body: some View {
        TabView(selection: $selected) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(Tab.home)
            
            UserView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(Tab.user)
        }
        .accentColor(.black)
    }
}

struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
